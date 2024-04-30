//
//  RegisterView.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 29/04/24.
//

import SwiftUI

struct RegisterView: View {
    
    var body: some View {
        VStack {
            Text("Sign UP")
                .font(.system(size: 28, weight: .bold))
//                .offset(y: 10)
            Spacer()
            
            //TextField
            VStack(spacing: 10) {
                
                MainTextField(title: "Username" ,text: "", isCompleted: true, isTextIcon: false)
                
                MainTextField(title: "Password", text: "", isCompleted: false, isTextIcon: true)
                
                MainTextField(title: "Email Address", text: "", isCompleted: true, isTextIcon: false)
                
            }
            Spacer()
            MainButton(title: "Sign Up", height: 80) {
                //action here
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    RegisterView()
}
