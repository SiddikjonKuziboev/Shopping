//
//  TabView.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 06/05/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
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
        
    }
}

#Preview {
    MainTabView()
}
