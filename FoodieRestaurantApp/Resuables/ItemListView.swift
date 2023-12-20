//
//  ItemListView.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 19/12/2023.
//

import SwiftUI

struct ItemListView: View {
    var itemImage: String
    var itemName: String
    var itemPrice: Int
    var itemDescription: String
    @State var itemQuantity: Int = 1
    var isCartView: Bool
    var addToCartAction: (() -> Void)?
    @State var isTapped: Bool = false
    
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
                    Text("NRs. " + String(itemPrice))
                        .font(.title2)
                    
                    if !isCartView {
                        Button(action: {
                            addToCartAction?()
                            isTapped = true
                        }, label: {
                            Text("Add to cart")
                        })
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.borderedProminent)
                        .tint(Color.orange)
                        .disabled(isTapped)
                    } else {
                        Button(action: {
    //                            viewModel.decreaseQuantity()
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerSize: CGSize(width:5, height: 5))
                                    .frame(width: 25, height: 25)
                                    .tint(Color.black)
                                
                                Image(systemName: "minus")
                                    .tint(Color.white)
                            }
                            .onTapGesture {
                                itemQuantity -= 1
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
                            }
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    ItemListView(itemImage: "https://loremflickr.com/640/480/food", itemName: "Item1", itemPrice: 7, itemDescription: "Item1 Description", isCartView: false)
}
