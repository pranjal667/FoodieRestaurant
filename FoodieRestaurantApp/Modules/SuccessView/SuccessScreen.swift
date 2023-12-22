//
//  SuccessScreen.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 22/12/2023.
//

import SwiftUI

struct SuccessScreen: View {
    // MARK: - properties
    @StateObject var viewModel: SuccessViewModel
    @State var goToRoot: Bool = false
    
    // MARK: - initialization
    init(viewModel: SuccessViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - body
    var body: some View {
        VStack {
            Text("Order is confirmed")
            Button("Ok") {
                goToRoot = true
            }
            .navigationDestination(isPresented: $goToRoot) {
                HomeScreen(viewModel: HomeViewModel(apiGet: NetworkManager()))
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SuccessScreen(viewModel: SuccessViewModel())
}
