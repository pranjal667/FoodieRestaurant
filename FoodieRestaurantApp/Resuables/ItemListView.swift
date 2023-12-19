//
//  ItemListView.swift
//  FoodieRestaurantApp
//
//  Created by ebpearls on 19/12/2023.
//

import SwiftUI

struct ItemListView: View {
    var itemImage: String
    var itemName: String
    var itemPrice: Int
    var itemDescription: String
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: itemImage)) { data in
                switch data {
                case .failure:
                    Image("")
                
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFit()
                    
                case .empty:
                    Image("")
                    
                @unknown default:
                    Image("")
                }
            }
                .frame(width: 100, height: 100)
            VStack(alignment: .leading) {
                Text(itemName)
                    .font(.title)
                    .fontWeight(.bold)
                Text(itemDescription)
                    .font(.title2)
            }
            Spacer()
            Text("NRs. " + String(itemPrice))
                .font(.title2)
        }
    }
}

#Preview {
    ItemListView(itemImage: "https://loremflickr.com/640/480/food", itemName: "Item1", itemPrice: 7, itemDescription: "Item1 Description")
}
