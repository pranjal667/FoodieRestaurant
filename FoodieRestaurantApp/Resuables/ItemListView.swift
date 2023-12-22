//
//  ItemListView.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 19/12/2023.
//

import SwiftUI

struct ItemListView: View {
    // MARK: - properties
    @State var itemQuantity: Int = 1
    @State var itemPrice: Int
    @State var isTapped: Bool = false
    @State var totalPrice: Int
    @State var updateIsTapped: Bool = false
    @State var itemId: String

    var itemImage: String
    var itemName: String
    var itemDescription: String
    var isCartView: Bool

    var totalClosure: ((String, Int) -> Void)?
    var addToCartAction: ((Bool) -> Void)?
    
    // MARK: - body
    var body: some View {
        VStack {            
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
                
                VStack {
                    Text("NRs. " + String(updateIsTapped ? totalPrice : itemPrice))
                        .font(.title2)
                    
                    if !isCartView {
                        Button(action: {
                            isTapped = true
                            addToCartAction?(isTapped)
                        }, label: {
                            Text("Add to cart")
                        })
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.borderedProminent)
                        .tint(Color.orange)
                        .disabled(isTapped)
                    } else {
                        VStack {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerSize: CGSize(width:5, height: 5))
                                        .frame(width: 25, height: 25)
                                        .tint(Color.black)
                                    
                                    Image(systemName: "minus")
                                        .tint(Color.white)
                                }
                                .onTapGesture {
                                    if itemQuantity > 1 {
                                        itemQuantity -= 1
                                    }
                                    totalPrice = itemPrice * itemQuantity
                                    updateIsTapped = false
                                }
                                
                                ZStack {
                                    RoundedRectangle(cornerSize: CGSize(width:5, height: 5))
                                        .frame(width: 50, height: 25)
                                        .tint(Color.black)
                                    
                                    Text(String(itemQuantity))
                                        .tint(Color.white)
                                }
                                
                                ZStack {
                                    RoundedRectangle(cornerSize: CGSize(width:5, height: 5))
                                        .frame(width: 25, height: 25)
                                        .tint(Color.black)
                                    
                                    Image(systemName: "plus")
                                        .tint(Color.white)
                                }
                                .onTapGesture {
                                    itemQuantity += 1
                                    totalPrice = itemPrice * itemQuantity
                                    updateIsTapped = false
                                }
                            }
                            
                            Button("Update") {
                                updateIsTapped = true
                                totalClosure?(itemName,totalPrice)
                            }
                            .buttonBorderShape(.capsule)
                            .buttonStyle(.borderedProminent)
                            .tint(Color.black)
                            .disabled(isTapped)
                        }
                    }
                }
            }
        }
    }
}

// MARK: - preview
#Preview {
    ItemListView(itemPrice: 7, totalPrice: 50, itemId: "1", itemImage: "https://loremflickr.com/640/480/food", itemName: "Item1", itemDescription: "Item1 Description", isCartView: true)
}
