//
//  MainView.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 30/04/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    @StateObject var authenticateModel = AuthenticationViewModel()
    
    var body: some View {
        if viewModel.isSignedIn {
            MainTabView()
        }else {
            NavigationStack {
                LetGetStartedView()
            }
        }
    }
}

#Preview {
    MainView()
}
