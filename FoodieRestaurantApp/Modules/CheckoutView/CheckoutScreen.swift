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
            VStack(alignment: .leading) {
                VStack {
                    Text("Payment Details")
                    ForEach(viewModel.checkoutItem, id: \.self) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text(String(item.amount))
                        }
                    }
                }
                Divider()
            }
            .onAppear {
                print(viewModel.checkoutItem)
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

// MARK: - preview
#Preview {
    CheckoutScreen(viewModel: CheckoutViewModel(checkoutItem: [CheckoutItem]()))
}
