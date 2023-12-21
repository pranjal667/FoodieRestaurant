//
//  CheckoutViewModel.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 20/12/2023.
//

import Foundation

class CheckoutViewModel: ObservableObject {
    // MARK: - properties
//    @Published var cartItems: [CartItem]
    @Published var checkoutItem: [CheckoutItem]
    
    // MARK: - initialization
    init(checkoutItem: [CheckoutItem]) {
        self.checkoutItem = checkoutItem
    }
}
