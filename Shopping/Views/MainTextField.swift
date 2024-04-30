//
//  MainTextField.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 29/04/24.
//

import SwiftUI

struct MainTextField: View {
    var title: String = "Username"
    @State var text: String = ""
    @State var isCompleted: Bool
    var isTextIcon = false
    private let iconName = "check"
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.gray)
                .font(.system(size: 13))
            HStack {
            TextField("eee", text: $text)
                .textFieldStyle(DefaultTextFieldStyle())
                .foregroundStyle(.black)
                .font(.system(size: 15))
                Spacer()
                if isTextIcon {
                    Text("Strong")
                        .font(.system(size: 11))
                }else {
                    Image(isCompleted ? iconName : "")
                        .frame(width: 20, height: 20)
                }
              
        }
            Divider()
        }
        .padding()
        
    }
}

#Preview {
    MainTextField(isCompleted: true)
}
