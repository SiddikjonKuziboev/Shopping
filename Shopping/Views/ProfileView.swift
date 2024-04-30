//
//  ProfileView.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 30/04/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                if let user = viewModel.user {
                    profile(user: user)
                }else {
                    Text("Loading profile...")
                }
                    
            } 
            .padding()
            .navigationTitle("Profile")
        }
        .onAppear(perform: {
            viewModel.fetchUser()
        })
       
    }
    
    @ViewBuilder
    func profile(user: User)-> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.blue)
            .frame(width: 125, height: 125)
        
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Name: ")
                Text(user.name)
            }
            
            HStack {
                Text("Email: ")
                Text(user.email)
            }
            
            HStack {
                Text("Member Since: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            
            Spacer()
            
            MainButton(title: "Log out",
                       backgroundColor: .red,
                       height: 35,
                       cornerRadius: 10)
            {
                viewModel.logOut()
            }
        }
    }
}

#Preview {
    ProfileView()
}
