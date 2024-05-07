//
//  HomeBrandCollectionView.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 06/05/24.
//

import SwiftUI

struct HomeBrandCollectionViewCell: View {
    var text: String = "Adidas"
    var image: String = "adidas"
    
    var body: some View {
        HStack {
            Image(image)
                .frame(width: 40, height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .background(.white)
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 10))
            Text(text)
                .font(.system(size: 15, weight: .bold))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
        }
        
        .background(.F_5_F_6_FA)
        .clipShape(RoundedRectangle(cornerRadius: 10))

        
    }
}

#Preview {
    HomeBrandCollectionViewCell()
}
