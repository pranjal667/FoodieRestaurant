//
//  CheckoutScreen.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 20/12/2023.
//

import SwiftUI

struct CheckoutScreen: View {
    // MARK: - properties
    @StateObject var viewModel: CheckoutViewModel
    
    // MARK: - initialization
    init(viewModel: CheckoutViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - body
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                VStack {
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading) {
                            Text ("Enter your Contact No.: ")
                            TextField("Contact No.", text: $viewModel.contactNo)
                                .overlay(content: {
                                    RoundedRectangle(cornerRadius: 5)
                                        .border(Color.black)
                                        .foregroundStyle(Color.clear)
                                })
                                .onChange(of: viewModel.contactNo, perform: { value in
                                    viewModel.isEmpty = false
                                })
                        }
                        
                        VStack(alignment: .leading) {
                            Text ("Enter your Delivery Address: ")
                            TextField("Address", text: $viewModel.address)
                                .overlay(content: {
                                    RoundedRectangle(cornerRadius: 5)
                                        .border(Color.black)
                                        .foregroundStyle(Color.clear)
                                })
                                .onChange(of: viewModel.contactNo, perform: { value in
                                    viewModel.isEmpty = false
                                })
                        }
                    }
                    .padding(.bottom, 100)
                    
                    VStack {
                        Text("Payment Details")
                        
                        ForEach(viewModel.checkoutItem, id: \.self) { item in
                            HStack {
                                Text(item.name)
                                
                                Spacer()
                                
                                Text("NRs. " + String(item.amount))
                                    .onAppear {
                                        viewModel.totalAmount += item.amount
                                    }
                            }
                        }
                        
                        Divider()
                        Divider()
                        
                        HStack {
                            Text("Total")
                            
                            Spacer()
                            
                            Text("NRs. " + "\(viewModel.totalAmount)")
                        }
                    }
                    
                    if viewModel.isEmpty {
                        Text("Contact or address cannot be empty!!!")
                            .foregroundColor(.red)
                            .padding(.top, 100)
                    } else {
                        Text("Please make sure you have entered correct contact details before confirming order.")
                            .padding(.top, 100)
                    }
                }
                .padding()

                Button(action: {
                    viewModel.checkForEmptyText()
                }, label: {
                    Text("Confirm")
                })
                .frame(width: 300, height: 50)
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                .tint(Color.orange)
                .disabled(viewModel.isEmpty)
                .navigationDestination(isPresented: $viewModel.confirmOrder) {
                    SuccessScreen(viewModel: SuccessViewModel())
                }
            }
            .navigationTitle("Checkout")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.orange, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarBackButtonHidden()
            .backButton()
        }
    }
}

// MARK: - preview
#Preview {
    CheckoutScreen(viewModel: CheckoutViewModel(checkoutItem: [CheckoutItem]()))
}
