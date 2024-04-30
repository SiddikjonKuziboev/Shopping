//
//  LoginViewViewModel.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 29/04/24.
//

import SwiftUI
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email: String = "" {
        didSet {
            isCompleted = !email.isEmpty
        }
    }
    @Published var password: String = ""
    @Published var isCompleted: Bool = false
    @Published var errorMessage: String = ""
    
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func validate()-> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces ).isEmpty else {
            errorMessage = "Please fill in all field"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Pease enter a valid email"
            return false
        }
        
        isCompleted = true
        print("called")
        return true
    }
}
