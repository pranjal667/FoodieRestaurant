//
//  CartScreen.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 19/12/2023.
//

import SwiftUI

struct CartScreen: View {
    // MARK: - properties
    @StateObject var viewModel: CartViewModel
    
    // MARK: - initialization
    init(viewModel: CartViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - body
    var body: some View {
        ScrollView {
            VStack(spacing: 10,content: {
                if !viewModel.cartItems.isEmpty {
                    ForEach(viewModel.cartItems, id: \.self) { item in
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
                                itemDescription: item.description,
                                isCartView: true
                            ) {
                            }
                            .tint(Color.black)
                        })
                        .padding([.top, .leading, .trailing], 10)
                        
                        Divider()
                    }
                } else {
                    Text("Cart is Empty")
                        .padding(50)
                }
            })
            
            Divider()
            
            RoundedRectangle(cornerSize: CGSize(width: 25, height: 50))
                .overlay {
                    NavigationLink("Checkout") {
                            EmptyView()
                    }
                    .foregroundStyle(Color.white)
                }
                .frame(width: 200, height: 50, alignment: .center)
                .foregroundStyle(Color.orange)
                .disabled(viewModel.cartItems.isEmpty)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.orange, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBarBackButtonHidden()
        .backButton()
    }
}

// MARK: - preview
#Preview {
    CartScreen(viewModel: CartViewModel(cartItems: Item()))
}
