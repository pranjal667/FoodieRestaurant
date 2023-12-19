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
    
    // MARK: - initialization
    init(itemImage: String, itemName: String, itemPrice: Int, itemDescription: String) {
        self.itemImage = itemImage
        self.itemName = itemName
        self.itemPrice = itemPrice
        self.itemDescription = itemDescription
    }
}
