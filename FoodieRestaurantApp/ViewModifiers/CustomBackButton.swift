//
//  CustomBackButton.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 20/12/2023.
//

import SwiftUI

struct CustomBackButton: ViewModifier {
    // MARK: - properties
    @Environment (\.dismiss) var dismiss

    // MARK: - body
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .tint(.black)
                    })
                }
            }
    }
}
