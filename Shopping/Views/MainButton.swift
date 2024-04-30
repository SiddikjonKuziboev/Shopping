//
//  MainButton.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 29/04/24.
//

import SwiftUI

struct MainButton: View {
    let title: String
    var backgroundColor: Color = .purple
    var height: CGFloat = 40
    var cornerRadius: CGFloat = 0
    let action: ()-> Void

    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundStyle(backgroundColor)
                    .frame(height: height)
            
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
        }
        
    }
}

#Preview {
    MainButton(title: "main", action: {})
}
