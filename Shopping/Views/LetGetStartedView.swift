//
//  LetGetStartedView.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 29/04/24.
//

import SwiftUI

struct LetGetStartedView: View {
    @State private var path = NavigationPath()
    
var body: some View {
    NavigationStack(path: $path) {
        VStack {
            Text("Sign UP")
                .font(.system(size: 28, weight: .bold))
            Spacer()
            
            VStack {
                MainButton(title: "FaceBook", backgroundColor: .facebook1, height: 50, cornerRadius: 10) {}
                MainButton(title: "Twitter", backgroundColor: .twitter, height: 50, cornerRadius: 10) {}
                MainButton(title: "Google", backgroundColor: .google, height: 50, cornerRadius: 10) {}
            }
            .padding()
            
            Spacer()
            
            VStack {
                Text("Already have an account?")
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Sign In")
                        .foregroundStyle(.black)
                        .bold()
                        .font(.system(size: 13))
                    
                }
                
                    MainButton(title: "Create an Account", backgroundColor: .buttonpurple, height: 80, cornerRadius: 0, action: {
                        path.append(GetStart.register.rawValue)
                    })
                
            }
        }
        .navigationDestination(for: String.self, destination: { type in
            switch type {
            case "register":
                RegisterView()
            case "login":
                LoginView()
            default:
                EmptyView()
                
            }
        })
        .padding(.top)
        .ignoresSafeArea(.all, edges: .bottom)
    }
     
    }
    
    enum GetStart: String {
        case login
        case register
        case gmail
    }
}

#Preview {
    LetGetStartedView()
}
