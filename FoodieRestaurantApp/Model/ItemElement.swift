//
//  ItemElement.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 18/12/2023.
//

import Foundation

typealias Item = [ItemElement]

class ItemElement: Codable, Hashable, ObservableObject {
    var posDisplayCategoryID: Int
    var item, description: String
    var taxable: Bool
    var imageURL: String
    var price: Int
    var id: String
    
    init(posDisplayCategoryID: Int, item: String, description: String, taxable: Bool, imageURL: String, price: Int, id: String) {
        self.posDisplayCategoryID = posDisplayCategoryID
        self.item = item
        self.description = description
        self.taxable = taxable
        self.imageURL = imageURL
        self.price = price
        self.id = id
    }
    
    enum CodingKeys: String, CodingKey {
        case posDisplayCategoryID, item, description, taxable
        case imageURL = "imageUrl"
        case price, id
    }
    
    static func == (lhs: ItemElement, rhs: ItemElement) -> Bool {
        return lhs.posDisplayCategoryID == rhs.posDisplayCategoryID &&
               lhs.item == rhs.item &&
               lhs.description == rhs.description &&
               lhs.taxable == rhs.taxable &&
               lhs.imageURL == rhs.imageURL &&
               lhs.price == rhs.price &&
               lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(posDisplayCategoryID)
        hasher.combine(item)
        hasher.combine(description)
        hasher.combine(taxable)
        hasher.combine(imageURL)
        hasher.combine(price)
        hasher.combine(id)
    }
}

