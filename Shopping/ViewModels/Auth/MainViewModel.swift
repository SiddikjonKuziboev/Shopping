//
//  MainViewModel.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 30/04/24.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import Firebase

class MainViewModel: ObservableObject {
    @Published var currentUserId: String = ""
   private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        
//      Auth.auth().addStateDidChangeListener({[weak self] _, user in
//          if let user = user {
//              
//              self?.currentUserId = user.uid
//          }else {
//              self?.currentUserId = ""
//
//          }
//        })
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
   
    
}
