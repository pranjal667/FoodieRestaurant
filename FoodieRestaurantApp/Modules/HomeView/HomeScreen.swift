//
//  HomeScreen.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 18/12/2023.
//

import SwiftUI

struct HomeScreen: View {
    // MARK: - properties
    @StateObject private var viewModel: HomeViewModel
    @State var image: Image = Image("")
    // MARK: - initilization
    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - body
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 50,content: {
                    ForEach(viewModel.items, id: \.self) { item in
                        NavigationLink(destination: {
                            ItemDetailScreen(viewModel: ItemDetailViewModel(
                                itemImage: item.imageURL,
                                itemName: item.item,
                                itemPrice: item.price,
                                itemDescription: item.description)
                            )
                        }, label: {
                                ItemView(
                                    itemImage: item.imageURL,
                                    itemName: item.item,
                                    itemPrice: item.price,
                                    itemDescription: item.description
                                )
                                .tint(Color.black)
                        })
                        .padding([.leading, .trailing],20)
                    }
                })
                .ignoresSafeArea()
                .navigationTitle("Foodie Restaurant")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Image(systemName: "magnifyingglass.circle")
                        Image(systemName: "cart.circle")
                    }
                }
                .toolbarBackground(Color.orange, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
        }
        .onAppear {
            viewModel.getDataFromApi()
        }
    }
}

// MARK: - preview
#Preview {
    HomeScreen(viewModel: HomeViewModel(apiGet: NetworkManager()))
}
