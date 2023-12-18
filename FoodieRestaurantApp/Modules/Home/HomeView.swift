//
//  HomeScreen.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 18/12/2023.
//

import SwiftUI

struct HomeView: View {
    // MARK: - properties
    @StateObject private var viewModel: HomeViewModel
    
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
                        ItemView(itemImage: item.imageURL, itemName: item.item, itemPrice: item.price, itemDescription: item.description)
                    }
                    .ignoresSafeArea()
                    .navigationTitle("Foodie Restaurant")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItemGroup(placement: .topBarTrailing) {
                            Text("search")
                            Text("cart")
                        }
                    }
                    .toolbarBackground(Color.orange, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                })
            }
        }
    }
}

// MARK: - preview
#Preview {
    HomeView(viewModel: HomeViewModel(apiGet: NetworkManager()))
}
