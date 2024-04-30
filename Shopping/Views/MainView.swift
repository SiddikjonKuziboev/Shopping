//
//  MainView.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 30/04/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        }else {
            LetGetStartedView()
        }
    }
}

#Preview {
    MainView()
}
