//
//  HomeViewModel.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 18/12/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    var items: [ItemElement] = []
    let apiGet: NetworkManager
    
    init(apiGet: NetworkManager) {
        self.apiGet = apiGet
    }
    
    func getDataFromApi() {
        if let url = URL(string: "https://63fefa26c5c800a72388f5d2.mockapi.io/getRestaurantItems#") {
            apiGet.getData(requestUrl: url, resultType: Item.self) { result in
                self.items.append(contentsOf: result)
            }
        }
    }
}
