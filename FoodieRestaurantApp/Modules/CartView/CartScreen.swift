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
    
    // MARK: - initialization
    init(viewModel: CartViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - body
    var body: some View {
        VStack {
            
        }
    }
}

#Preview {
    CartScreen(viewModel: CartViewModel())
}
