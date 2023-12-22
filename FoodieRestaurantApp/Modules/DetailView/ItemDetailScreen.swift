//
//  ItemDetailScreen.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 19/12/2023.
//

import SwiftUI

struct ItemDetailScreen: View {
    // MARK: - properties
    @StateObject var viewModel: ItemDetailViewModel    
    
    // MARK: - initialization
    init(viewModel: ItemDetailViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - body
    var body: some View {
        VStack {
            ItemDetailView(itemImage: viewModel.itemImage, itemName: viewModel.itemName, itemPrice: viewModel.itemPrice, itemDescription: viewModel.itemDescription, itemId: viewModel.itemId)
                .padding(20)
            
            HStack {                
                Button(action: {
                    viewModel.addToCart()
                }, label: {
                    Text(viewModel.isAddedToCart ? "Item already in cart" : "Add to cart")
                })
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                .tint(Color.orange)
                .disabled(viewModel.isAddedToCart)
            }
            Spacer()
        }
        .navigationTitle(viewModel.itemName)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.orange, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBarBackButtonHidden()
        .backButton()
        .onAppear {
            viewModel.checkIfItemIsAdded()
        }
    }
}

#Preview {
    ItemDetailScreen(viewModel: ItemDetailViewModel(
        itemImage: "https://loremflickr.com/640/480/food",
        itemName: "Item1", 
        itemPrice: 7,
        itemDescription: "Item1 Description", 
        isAddedToCart: true, 
        itemId: "1", 
        listItemId: "1")
    )
}
