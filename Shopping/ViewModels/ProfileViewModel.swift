//
//  ProfileViewModel.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 30/04/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
 
    @Published var user: UserDM? = nil
    
    init() {
        
    }
    func fetchUser() {
        guard let id = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(id).getDocument {[weak self] snapshot, error in
            guard let data = snapshot?.data() , error == nil else {
                return
            }
            self?.user = UserDM(id: data["id"] as? String ?? "",
                              name: data["name"] as? String ?? "",
                              email: data["email"] as? String ?? "",
                              joined: data["joined"] as? TimeInterval ?? 0.0)
            
        }
        
    }
    
    func logOut() {
        do {
           try Auth.auth().signOut()
        } catch {
            
        }
    }
}
