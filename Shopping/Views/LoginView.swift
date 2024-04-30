//
//  LoginView.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 29/04/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        VStack {
            
            //Header title
            VStack {
                Text("Welcome")
                    .font(.system(size: 28, weight: .bold))
                Text("Please enter your data to continue")
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
            }
            .padding()
            
            Spacer()
            
            //TextField
            VStack(alignment: .trailing, spacing: 30) {
                VStack(spacing: 20) {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    MainTextField(title: "Email", text: $viewModel.email, isCompleted: $viewModel.isCompleted)
                    
                    CustomSecureTextField(title: "Password", text: $viewModel.password)
                    
                }
                Text("Forgot password?")
                    .foregroundStyle(.red)
                    .padding()
            }
            
            //Terms and conditions
            Spacer()
            VStack(spacing: 15) {
                VStack {
                    Text("By connecting your account confirm that you agree with our")
                        .font(.system(size: 13))
                        .foregroundStyle(.gray)
                    NavigationLink {
                        Text("privacy policy")
                    } label: {
                        Text("Term and Condition")
                            .foregroundStyle(.black)
                            .bold()
                            .font(.system(size: 13))
                        
                    }
                }
                
                //Button
                MainButton(title: "Login", backgroundColor: .buttonpurple, height: 80) {
                    viewModel.login()
                }
                
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
}

#Preview {
    LoginView()
}
