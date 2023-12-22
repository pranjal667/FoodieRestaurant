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
    @State var isAddedToCart: Bool = false
    @State var cartItemId: String = ""
    
    // MARK: - initilization
    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - body
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10,content: {
                    ForEach(viewModel.searchText.isEmpty ? viewModel.items : viewModel.filteredSearchList, id: \.self) { item in
                        NavigationLink(destination: {
                            ItemDetailScreen(viewModel: ItemDetailViewModel(
                                itemImage: item.imageURL,
                                itemName: item.item,
                                itemPrice: item.price,
                                itemDescription: item.description, 
                                isAddedToCart: isAddedToCart, 
                                itemId: item.id, 
                                listItemId: self.cartItemId),
                                             cartArray: $viewModel.cartArray
                            )
                        }, label: {
                                ItemListView(
                                    itemPrice: item.price, 
                                    totalPrice: item.price, 
                                    itemId: item.id, 
                                    itemImage: item.imageURL,
                                    itemName: item.item,
                                    itemDescription: item.description,
                                    isCartView: false, addToCartAction:  { isAddedToCart in
                                        self.isAddedToCart = isAddedToCart
                                        self.cartItemId = item.id
                                        viewModel.itemQuantity += 1
                                        let item = CartItem(item: item.item, description: item.description, taxable: item.taxable, imageURL: item.imageURL, price: item.price, id: item.id)
                                        viewModel.cartArray.append(item)
                                    })
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
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: {
                            CartScreen(viewModel: CartViewModel(cartItems: viewModel.cartArray))
                        }, label: {
                            Image(systemName: "cart.circle")
                                .foregroundStyle(Color.black)
                        })
                        .overlay {
                            if viewModel.itemQuantity > 0 {
                                BadgeView(count: viewModel.itemQuantity)
                            }
                        }
                    }
                }
                .toolbarBackground(Color.orange, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .navigationBarBackButtonHidden()
            }
        }
        .searchable(text: $viewModel.searchText, prompt: "Search for Items")
        .onAppear {
            viewModel.getDataFromApi()
        }
    }
}

// MARK: - preview
#Preview {
    HomeScreen(viewModel: HomeViewModel(apiGet: NetworkManager()))
}
