//
//  RegisterViewModel.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 30/04/24.
//

import FirebaseAuth
import FirebaseFirestore
import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
     @Published var password: String = ""
     @Published var isCompleted: Bool = false
    @Published var passwordStatus: PasswordStatus = .none
    
    init() {
       
    }
    
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result , error  in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
            
        }
    }
    
    private func insertUserRecord(id: String) {
        let user = User(id: id,
                        name: name,
                        email: email,
                        joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(user.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
    
    enum PasswordStatus: String {
        case low = "Low"
        case strong = "Strong"
        case middle = "Middle"
        case none = ""
    }
}

