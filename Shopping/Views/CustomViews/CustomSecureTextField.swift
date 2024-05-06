//
//  CustomSecureTextField.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 30/04/24.
//

import SwiftUI

struct CustomSecureTextField: View {
    
    var title: String = "Username"
    @Binding var text: String
    var turnOffIcons = false

    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.gray)
                .font(.system(size: 13))
            HStack {
                SecureField("eee", text: $text)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .foregroundStyle(.black)
                    .font(.system(size: 15))
                Spacer()
                if !turnOffIcons {
                    Text("Strong")
                        .font(.system(size: 11))
                        .foregroundStyle(.green)
                    
                }

            }
            Divider()
        }
        .padding()
        
    }
    
}

#Preview {
    CustomSecureTextField(text: .constant(""))
}
