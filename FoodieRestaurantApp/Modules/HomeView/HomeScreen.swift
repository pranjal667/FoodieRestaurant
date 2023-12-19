//
//  HomeScreen.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 18/12/2023.
//

import SwiftUI

struct HomeScreen: View {
    // MARK: - properties
    @EnvironmentObject var item: ItemElement
    @StateObject private var viewModel: HomeViewModel
    @State var image: Image = Image("")
    @State var itemQuantity: Int = 0
    @State var cartArray: [ItemElement] = []
    
    // MARK: - initilization
    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - body
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10,content: {
                    ForEach(viewModel.items, id: \.self) { item in
                        NavigationLink(destination: {
                            ItemDetailScreen(viewModel: ItemDetailViewModel(
                                itemImage: item.imageURL,
                                itemName: item.item,
                                itemPrice: item.price,
                                itemDescription: item.description)
                            )
                        }, label: {
                                ItemListView(
                                    itemImage: item.imageURL,
                                    itemName: item.item,
                                    itemPrice: item.price,
                                    itemDescription: item.description
                                ) {
                                    itemQuantity += 1
                                }
                                .tint(Color.black)
                        })
                        .padding([.top, .leading, .trailing], 10)
                        
                        Divider()
                    }
                })
                .ignoresSafeArea()
                .navigationTitle("Foodie Restaurant")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Image(systemName: "magnifyingglass.circle")
                        Image(systemName: "cart.circle")
                            .overlay {
                                ZStack {
                                    Text(String(itemQuantity))
                                        .tint(Color.red)
                                }
                                .offset(x:15,y: -7)
                            }
                            .overlay {
                                NavigationLink("") {
                                    CartScreen(viewModel: CartViewModel())
                                }
                            }
                    }
                }
                .toolbarBackground(Color.orange, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                }
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
