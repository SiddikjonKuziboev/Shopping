//
//  ShoppingApp.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 29/04/24.
//

import SwiftUI
import FirebaseCore

@main
struct ShoppingApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LetGetStartedView()
            }
        }
    }
}
