//
//  ContentView.swift
//  Shopping
//
//  Created by Siddikjon Kuziboev on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    let brands: [String] = ["adidas", "adidas1", "adidas2", "adidas3"]
    
    var body: some View {
        NavigationStack {
            List {
                Section(content: {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.fixed(50))], spacing: 10, pinnedViews: .sectionHeaders) {
                            ForEach(brands, id: \.self) { item in
                                HomeBrandCollectionViewCell()
                            }
                            
                        }
                        
                    }
                    
                }, header: {
                    HStack {
                        Text("Choose Brand")
                            .font(.system(size: 17))
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.black)
                        Spacer()
                        NavigationLink {
                            Text("all")
                        } label: {
                            Text("View All")
                                .multilineTextAlignment(.trailing)
                                .foregroundStyle(.gray)
                            
                        }
                        
                    }
                    
                })
                .listRowSeparator(.hidden)
                .background(.clear)
                
                Section(content: {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20, pinnedViews: .sectionHeaders) {
                        
                        ForEach(brands, id: \.self) { item in
                        
                            HomeMainCollectionViewCell( action: {})
                        }
                    }

                }, header: {
                    HStack {
                        Text("New Arraival")
                            .font(.system(size: 17))
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.black)
                        Spacer()
                        NavigationLink {
                            Text("all")
                        } label: {
                            Text("View All")
                                .multilineTextAlignment(.trailing)
                                .foregroundStyle(.gray)
                            
                        }
                    }
                })
                .listRowSeparator(.hidden)


            }
            

            .listStyle(GroupedListStyle())
            .background(Color.red)
            .navigationTitle("Hemendra")
        }
        

        
        
    }
}

#Preview {
    ContentView()
}
