//
//  AuthenticationViewModel.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 03/05/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import GoogleSignIn

class AuthenticationViewModel: ObservableObject {
    
    @Published var currentUser: UserDM?
    @Published var isAuthenticated: Bool = false
    @Published var showRegisterAlert = false


    init(){
        
//        Auth.auth().addStateDidChangeListener {[weak self] auth, user in
//            if let user = user {
////                self?.currentUser = User(id: user.uid, name: user.displayName ?? "", email: user.email ?? "", joined: TimeInterval())
//                self?.isAuthenticated = true
//                
//            }else {
//                self?.currentUser = nil
//                self?.isAuthenticated = false
//            }
//        }
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
                self?.checkUserInFaceBook(user: user)
            }
        }
        
    }
    
   private func checkUserInFaceBook(user: User) {
        
        let userCollection = Firestore.firestore().collection("users")
        
        userCollection.whereField("userId", isEqualTo: user.uid).getDocuments {[weak self] snapshot, error in
            
            if let error = error {
                print("Error fetching user document: \(error.localizedDescription)")
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            if !documents.isEmpty {
                
                self?.currentUser = UserDM(id: user.uid, name: user.displayName ?? "", email: user.email ?? "", joined: TimeInterval())
                self?.isAuthenticated = true
                
            }else {
                self?.showRegisterAlert = true
                self?.currentUser = nil
                self?.isAuthenticated = false
            }
        }
    }
    
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            currentUser = nil
            isAuthenticated = false
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
  
}
