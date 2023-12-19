//
//  ItemDetailView.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 18/12/2023.
//

import SwiftUI

struct ItemDetailView: View {
    var itemImage: String
    var itemName: String
    var itemPrice: Int
    var itemDescription: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            AsyncImage(url: URL(string: itemImage)) { data in
                switch data {
                case .failure:
                    Image("")
                
                case .success(let image):
                    image
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: 500)
                        .scaledToFit()
                    
                case .empty:
                    Image("")
                    
                @unknown default:
                    Image("")
                }
            }
            
            HStack {
                Text(itemName)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Text("NRs. " + String(itemPrice))
                    .font(.title)
                    .fontWeight(.bold)
            }
            Text(itemDescription)
                .font(.title2)
        }
    }
}

#Preview {
    ItemDetailView(itemImage: "https://loremflickr.com/640/480/food", itemName: "Item1", itemPrice: 7, itemDescription: "Item1 Description")
}
