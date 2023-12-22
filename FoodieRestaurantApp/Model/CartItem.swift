//
//  CartItem.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 21/12/2023.
//

import Foundation

struct CartItem: Identifiable {
    var item, description: String
    var taxable: Bool
    var imageURL: String
    var price: Int
    var unit: Int = 1
    var id: String
}
