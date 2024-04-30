//
//  MainTextField.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 29/04/24.
//

import SwiftUI

struct MainTextField: View {
    var title: String = "Username"
    @Binding var text: String
    @Binding var isCompleted: Bool
    private let iconName = "check"
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.gray)
                .font(.system(size: 13))
            HStack {
                TextField("eee", text: $text)
                    .foregroundStyle(.black)
                    .font(.system(size: 15))
                Spacer()
                if isCompleted {
                    Image(iconName)
                        .frame(width: 20, height: 20)
                }
               
                
            }
            Divider()
        }
        .padding()
        
    }
}

#Preview {
    MainTextField(text: .constant("s"), isCompleted: .constant(false))
}
