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
    @Published var userExistsInFirestore: Bool = false

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
        let user = UserDM(id: id,
                        name: name,
                        email: email,
                        joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(user.asDictionary()) {[weak self] error in
                if let _ = error {
                    
                }else {
                    self?.checkUserInFirestore(userId: id)
                }
            }
    }
    
    func checkUserInFirestore(userId: String?) {
        guard let userId = userId else { return }
           let usersCollection = Firestore.firestore().collection("users")
           usersCollection.document(userId).getDocument { snapshot, error in
               if let error = error {
                   print("Error fetching user document: \(error.localizedDescription)")
                   return
               }

               if let _ = snapshot?.data() {
                   self.userExistsInFirestore = true
               } else {
                   self.userExistsInFirestore = false
               }
           }
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

