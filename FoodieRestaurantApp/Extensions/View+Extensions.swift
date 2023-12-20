//
//  View+Extensions.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 20/12/2023.
//

import SwiftUI

extension View {
    // MARK: - backButton
    func backButton() -> some View {
        modifier(CustomBackButton())
    }
}
