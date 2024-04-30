//
//  LoginView.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 29/04/24.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""

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
                        
                        MainTextField(title: "Username" ,text: "", isCompleted: true, isTextIcon: false)
                            
                        SecureField("", text: `$`"")
                        MainTextField(title: "Password", text: "", isCompleted: false, isTextIcon: true)
                    
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
                        
                    }
                    
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
    }
    
}

#Preview {
    LoginView()
}
