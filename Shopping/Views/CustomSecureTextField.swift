//
//  CustomSecureTextField.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 30/04/24.
//

import SwiftUI

struct CustomSecureTextField: View {
    
    var title: String = "Username"
    @State var text: String = ""
    @State var isCompleted: Bool
    var isTextIcon = false
    
    
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
                
                Text("Strong")
                    .font(.system(size: 11))
                
            }
            Divider()
        }
        .padding()
        
    }
    
}

#Preview {
    CustomSecureTextField(title: "abs", isCompleted: false)
}
