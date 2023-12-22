//
//  ItemDetailViewModel.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 19/12/2023.
//

import Foundation
import SwiftUI

class ItemDetailViewModel: ObservableObject {
    // MARK: - properties
    @Published var itemImage: String
    @Published var itemName: String
    @Published var itemPrice: Int
    @Published var itemDescription: String
    @Published var isAddedToCart: Bool
    @Published var itemId: String
    @Published var quantity: Int = 1
    @Published var listItemId: String
    
    // MARK: - initialization
    init(itemImage: String, itemName: String, itemPrice: Int, itemDescription: String, isAddedToCart: Bool, itemId: String, listItemId: String) {
        self.itemImage = itemImage
        self.itemName = itemName
        self.itemPrice = itemPrice
        self.itemDescription = itemDescription
        self.isAddedToCart = isAddedToCart
        self.itemId = itemId
        self.listItemId = listItemId
    }
    
    // MARK: - addToCart
    func addToCart() {
        
    }
    
    // MARK: - addToCart
    func checkIfItemIsAdded() {
        if itemId == listItemId {
            isAddedToCart = true
        } else {
            isAddedToCart = false
        }
    }
}
