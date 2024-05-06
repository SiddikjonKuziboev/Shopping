//
//  LoginViewViewModel.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 29/04/24.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore
import GoogleSignIn

class LoginViewViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var currentUser: User?
       @Published var isAuthenticated = false
    @Published var userExistsInFirestore: Bool = false
    
    
    init() {
//        Auth.auth().addStateDidChangeListener { _, user in
//                    if let user = user {
//                        self.currentUser = user
////                        self.isAuthenticated = true
//                        self.checkUserInFirestore(userId: user.uid)
//                    } else {
//                        self.currentUser = nil
//                        self.isAuthenticated = false
//                    }
//                }
    }
    
    func loginWithGoogle() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) {[weak self] result, error in
                   if let error = error {
                       print("Sign-in error: \(error.localizedDescription)")
                   }
            self?.checkUserInFirestore(userId: result?.user.uid)
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
 
    private  func validate()-> Bool {
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
        
        return true
    }
    
 
    
}
