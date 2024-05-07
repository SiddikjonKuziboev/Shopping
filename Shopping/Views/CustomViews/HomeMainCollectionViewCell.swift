//
//  HomeMainCollectionView.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 06/05/24.
//

import SwiftUI

struct HomeMainCollectionViewCell: View {
    @State var isLiked: Bool = false
    var action: () -> Void
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            
            VStack(spacing: 5) {
                Image("brother")
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                VStack(alignment: .leading) {
                    Text("Nike Sportswear Club Fleece")
                        .lineLimit(2)
                        .font(.system(size: 11, weight: .regular))
                        .multilineTextAlignment(.leading)

                    Text("$99")
                        .font(.system(size: 13, weight: .bold))
                        .multilineTextAlignment(.leading)
                }
                
            }
            
            Button(action: {
                action()
            }, label: {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.buttonpurple)
                    .padding()
            })
            
        }
   
        
    }
    
}

#Preview {
    HomeMainCollectionViewCell( action: {})
}
