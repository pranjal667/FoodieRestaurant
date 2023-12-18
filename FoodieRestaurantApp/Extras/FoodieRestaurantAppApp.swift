//
//  FoodieRestaurantApp.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 18/12/2023.
//

import SwiftUI

@main
struct FoodieRestaurantAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel(apiGet: NetworkManager()))
        }
    }
}
