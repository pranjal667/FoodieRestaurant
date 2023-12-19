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
    @State var quantity: Int = 1
    
    // MARK: - initialization
    init(viewModel: ItemDetailViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - body
    var body: some View {
        VStack {
            ItemView(itemImage: viewModel.itemImage, itemName: viewModel.itemName, itemPrice: viewModel.itemPrice, itemDescription: viewModel.itemDescription)
                .padding(20)
            
            HStack {
                Button(action: {
                    decreaseQuantity()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width:5, height: 5))
                            .frame(width: 25, height: 25)
                            .tint(Color.black)
                        
                        Image(systemName: "minus")
                            .tint(Color.white)
                    }
                    .onTapGesture {
                        decreaseQuantity()
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width:5, height: 5))
                            .frame(width: 50, height: 25)
                            .tint(Color.black)
                        
                        Text(String(quantity))
                            .tint(Color.white)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width:5, height: 5))
                            .frame(width: 25, height: 25)
                            .tint(Color.black)
                        
                        Image(systemName: "plus")
                            .tint(Color.white)
                    }
                    .onTapGesture {
                        increaseQuantity()
                    }
                })
                
                Button(action: {
                    addToCart()
                }, label: {
                    Text("Add to cart")
                })
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                .tint(Color.orange)
            }
            Spacer()
        }
        .ignoresSafeArea()
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.orange, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
    
    func decreaseQuantity() {
        if quantity == 0 {
            quantity = 0
        } else {
            quantity -= 1
        }
    }
    
    func increaseQuantity() {
        quantity += 1
    }
    
    func addToCart() {
        
    }
}

#Preview {
    ItemDetailScreen(viewModel: ItemDetailViewModel(
        itemImage: "https://loremflickr.com/640/480/food",
        itemName: "Item1", 
        itemPrice: 7,
        itemDescription: "Item1 Description"))
}
