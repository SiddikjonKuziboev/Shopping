//
//  RegisterView.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 29/04/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
  
    var body: some View {
        VStack {
            Text("Sign UP")
                .font(.system(size: 28, weight: .bold))
//                .offset(y: 10)
            Spacer()
            
            //TextField
            VStack(spacing: 10) {
                
                MainTextField(title: "Name",
                              text: $viewModel.name,
                              isCompleted: $viewModel.isCompleted)
                
                MainTextField(title: "Password",
                              text: $viewModel.password,
                              isCompleted: $viewModel.isCompleted)
                
                MainTextField(title: "Email Address",
                              text: $viewModel.email,
                              isCompleted: $viewModel.isCompleted)
                
            }
            Spacer()
            MainButton(title: "Sign Up", height: 80) {
                viewModel.register()
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .navigationDestination(isPresented: $viewModel.userExistsInFirestore) {
            GenderView()
        }
    }
}

#Preview {
    RegisterView()
}
