//
//  CartViewModel.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 19/12/2023.
//

import Foundation

class CartViewModel: ObservableObject {
    // MARK: - properties
    @Published var cartItems: [CartItem]
    @Published var checkoutItem: [CheckoutItem] = []
    
    // MARK: - initialization
    init(cartItems: [CartItem]) {
        self.cartItems = cartItems
    }
    
    // MARK: - convertToCheckoutItem
    func convertToCheckoutItem(name: String, amount: Int) {
        checkoutItem.append(CheckoutItem(name: name, amount: amount))
    }
}
