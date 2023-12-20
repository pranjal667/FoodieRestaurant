//
//  CartViewModel.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 19/12/2023.
//

import Foundation

class CartViewModel: ObservableObject {
    // MARK: - properties
    @Published var cartItems: Item
    
    // MARK: - initialization
    init(cartItems: Item) {
        self.cartItems = cartItems
    }
}
