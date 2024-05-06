//
//  ShoppingApp.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 29/04/24.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

@main
struct ShoppingApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
                MainView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        FirebaseApp.configure()
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}
