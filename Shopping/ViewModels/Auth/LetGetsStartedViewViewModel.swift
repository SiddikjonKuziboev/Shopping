//
//  LetGetsStartedViewViewModel.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 01/05/24.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

import CryptoKit
import GoogleSignIn
import AuthenticationServices

class LetGetsStartedViewViewModel: NSObject, ObservableObject, ASAuthorizationControllerDelegate {
    @Published var isCreateAccount: Bool = false
    @Published var signedIn = false
    @Published var isLogSuccess: Bool = false
    @Published var isShowErrorAlert: Bool = false
    @Published var loginButton: Bool = false
    

    override init() {
        super.init()
        
        Auth.auth().addStateDidChangeListener {[weak self] auth, user in
//            self?.signedIn = user != nil
        }
    }
    
    func createRegister() {
        isCreateAccount = true
    }
    
    func login() {
        loginButton = true
    }
    
    
    func sigInWithGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // As you’re not using view controllers to retrieve the presentingViewController, access it through
        // the shared instance of the UIApplication
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [unowned self] result, error in
            guard error == nil else {
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                print("Error during Google Sign-In authentication, \(error.debugDescription)")
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            
            // Authenticate with Firebase
            Auth.auth().signIn(with: credential) {[weak self] authResult, error in
                guard let user = authResult?.user, error == nil else {
                    return
                }
                self?.checkUserInFirestore(user: user)
            }
        }
        
    }
    
    private func checkUserInFirestore(user: User) {
        
        let userCollection = Firestore.firestore().collection("users")
        
        userCollection.whereField("userId", isEqualTo: user.uid).getDocuments {[weak self] snapshot, error in
            
            if let error = error {
                print("Error fetching user document: \(error.localizedDescription)")
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            if !documents.isEmpty {
                
                self?.isLogSuccess = true
                
            }else {
                self?.isShowErrorAlert = true
                self?.isLogSuccess = false
            }
        }
    }
    
    
}


