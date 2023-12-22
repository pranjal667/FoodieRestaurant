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
    @Published var totalAmount: Int = 0
    @Published var contactNo: String = ""
    @Published var address: String = ""
    @Published var isEmpty: Bool = false
    @Published var confirmOrder: Bool = false
    
    // MARK: - initialization
    init(checkoutItem: [CheckoutItem]) {
        self.checkoutItem = checkoutItem
    }
    
    // MARK: - checkForEmptyText
    func checkForEmptyText() {
        if contactNo.isEmpty || address.isEmpty {
            isEmpty = true
            confirmOrder = false
        } else {
            isEmpty = false
            confirmOrder = true
        }
    }
}
