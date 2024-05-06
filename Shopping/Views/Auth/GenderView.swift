//
//  GenderView.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 06/05/24.
//

import SwiftUI

struct GenderView: View {
    @StateObject var viewModel = GenderViewModel()
    
    var body: some View {
        VStack() {
            Image("oka")
            bottomView()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
        }
        .background(.buttonpurple.gradient)
        .ignoresSafeArea(.all, edges: .bottom)

    }
    
    @ViewBuilder
    func bottomView()-> some View {
        VStack(spacing: 13) {
            Text("Look Good, Feel Good")
                .font(Font.title)
                .multilineTextAlignment(.center)
            Text("Create your individual & unique style and look amazing everyday.")
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .lineLimit(0)
                
            HStack(spacing: 10) {
                MainButton(title: "Women", titleColor: .gray, backgroundColor: Color.F_5_F_6_FA, height: 60, cornerRadius: 10) {
                    viewModel.isMale = false
                }
                
                MainButton(title: "Men", backgroundColor: Color.buttonpurple, height: 60, cornerRadius: 10) {
                    viewModel.isMale = true
                }
            }
            Button("Skip") {
                viewModel.skip()
            }
            .foregroundStyle(.gray)
            .frame(maxWidth: .infinity, maxHeight: 60)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .navigationDestination(isPresented: $viewModel.next) {
            MainTabView()
        }
    }
}

#Preview {
    GenderView()
}
