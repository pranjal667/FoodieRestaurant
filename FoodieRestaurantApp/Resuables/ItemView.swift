//
//  ItemView.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 18/12/2023.
//

import SwiftUI

struct ItemView: View {
    var itemImage: String
    var itemName: String
    var itemPrice: Int
    var itemDescription: String
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: itemImage))
            HStack {
                Text(itemName)
                Spacer()
                Text("NRs. " + String(itemPrice))
            }
            Text(itemDescription)
        }
    }
}

#Preview {
    ItemView(itemImage: "https://loremflickr.com/640/480/food", itemName: "Item1", itemPrice: 7, itemDescription: "Item1 Description")
}
