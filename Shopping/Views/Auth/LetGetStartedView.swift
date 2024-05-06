//
//  LetGetStartedView.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 29/04/24.
//

import SwiftUI

struct LetGetStartedView: View {

    @StateObject var viewModel = LetGetsStartedViewViewModel()
    
    
    var body: some View {
            VStack {
                Text("Let's get start")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
                
                VStack {
                    MainButton(title: "FaceBook", backgroundColor: .facebook1, height: 50, cornerRadius: 10) {}
                    MainButton(title: "Twitter", backgroundColor: .twitter, height: 50, cornerRadius: 10) {}
                    MainButton(title: "Google", backgroundColor: .google, height: 50, cornerRadius: 10) {
                        viewModel.sigInWithGoogle()
                    }
                }
                .padding()
                
                Spacer()
                
                VStack {
                    Text("Already have an account?")
                        .font(.system(size: 13))
                        .foregroundStyle(.gray)
                
                    Button {
                        viewModel.login()
                    } label: {
                        Text("Sign In")
                            .foregroundStyle(.black)
                            .bold()
                            .font(.system(size: 13))
                    }
                    .navigationDestination(isPresented: $viewModel.loginButton) {
                        LoginView()
                    }
                
                    
                    MainButton(title: "Create an Account", backgroundColor: .buttonpurple, height: 80, cornerRadius: 0, action: {
                        viewModel.createRegister()
                    })
                    
                    
                    .navigationDestination(isPresented: $viewModel.isCreateAccount) {
                        RegisterView()
                    }
                    
                }
                .alert(isPresented: $viewModel.isShowErrorAlert) {
                    Alert(
                        title: Text("Login"),
                        message: Text("You don't have existing account. You should register!"),
                        primaryButton: .default(Text("Ok"), action: {
                            viewModel.createRegister()
                        }), secondaryButton: .cancel() )
                    
                }
            }
            .padding(.top)
            .ignoresSafeArea(.all, edges: .bottom)
        }
}

#Preview {
    LetGetStartedView()
}
