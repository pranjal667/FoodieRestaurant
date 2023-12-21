//
//  BadgeView.swift
//  FoodieRestaurantApp
//
//  Created by ebpearls on 20/12/2023.
//

import SwiftUI

struct BadgeView: View {
    var count: Int

    var body: some View {
        Text("\(count)")
            .foregroundColor(.white)
            .font(Font.system(size: 12))
            .frame(width: 20, height: 20)
            .background(Color.red)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: 2)
            )
            .offset(x:20,y: -7)
    }
}
