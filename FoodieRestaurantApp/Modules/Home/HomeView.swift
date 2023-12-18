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
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - initilization
    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - body
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Hello")
                    Text("Hello")

                    Text("Hello")

                    Text("Hello")

                    ForEach(viewModel.items, id: \.self) { item in
                        Text("item.item")
//                        Text(item.price)
                    }
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
            }
            .onAppear {
                viewModel.getDataFromApi()
            }
        }
    }
}

// MARK: - preview
#Preview {
    HomeView(viewModel: HomeViewModel(apiGet: NetworkManager()))
}
