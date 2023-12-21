//
//  CartScreen.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 19/12/2023.
//

import SwiftUI

struct CartScreen: View {
    // MARK: - properties
    @StateObject var viewModel: CartViewModel
    @State var itemName: String = ""
    @State var itemAmount: Int = 1
    @State var show: Bool = false
    
    // MARK: - initialization
    init(viewModel: CartViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - body
    var body: some View {
        ScrollView {
            VStack(spacing: 10,content: {
                if !viewModel.cartItems.isEmpty {
                    ForEach(viewModel.cartItems) { item in
                        NavigationLink(destination: {
                            ItemDetailScreen(viewModel: ItemDetailViewModel(
                                itemImage: item.imageURL,
                                itemName: item.item,
                                itemPrice: item.price,
                                itemDescription: item.description)
                            )
                        }, label: {
                            ItemListView(                                
                                itemImage: item.imageURL,
                                itemName: item.item,
                                itemPrice: item.price,
                                itemDescription: item.description,
                                isCartView: true, 
                                totalClosure: { itemName,totalPrice in
                                    viewModel.checkoutItem.append(CheckoutItem(name: itemName, amount: totalPrice))
                                },
                                addToCartAction: {}
                            )
                            .tint(Color.black)
                        })
                        .padding([.top, .leading, .trailing], 10)
                        
                        Divider()
                    }
                } else {
                    Text("Cart is Empty")
                        .padding(50)
                }
            })
            
            Divider()
            
//            RoundedRectangle(cornerSize: CGSize(width: 25, height: 50))
//                .overlay {
                    Button("Checkout") {
                        show.toggle()
                    }
                    .frame(width: 200, height: 50)
                    .disabled(viewModel.cartItems.isEmpty)
                    .buttonBorderShape(.capsule)
                    .foregroundStyle(Color.white)
                    .background(Color.orange)
                    .navigationDestination(isPresented: $show, destination: {
                        CheckoutScreen(viewModel: CheckoutViewModel(checkoutItem: viewModel.checkoutItem))
                    })
//                                        NavigationLink("Checkout") {
//                                            CheckoutScreen(viewModel: CheckoutViewModel(checkoutItem: viewModel.checkoutItem))
//                                        }
//                    .foregroundStyle(Color.white)
//                }

        }
        .onAppear {
            viewModel.checkoutItem.removeAll()
        }
        .navigationTitle("Cart")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.orange, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBarBackButtonHidden()
        .backButton()
    }
}

// MARK: - preview
#Preview {
    CartScreen(viewModel: CartViewModel(cartItems: [CartItem]()))
}
