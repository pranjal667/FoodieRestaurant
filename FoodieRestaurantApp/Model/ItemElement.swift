//
//  ItemElement.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 18/12/2023.
//

import Foundation

struct ItemElement: Codable, Hashable {
    let posDisplayCategoryID: Int
    let item, description: String
    let taxable: Bool
    let imageURL: String
    let price: Int
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case posDisplayCategoryID, item, description, taxable
        case imageURL = "imageUrl"
        case price, id
    }
}

typealias Item = [ItemElement]
