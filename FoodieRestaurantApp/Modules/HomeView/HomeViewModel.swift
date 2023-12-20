//
//  HomeViewModel.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 18/12/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    // MARK: - properties
    @Published var items: [ItemElement] = []
    @Published var refresh: Bool = false
    @Published var isLoading: Bool = false
    @Published var itemQuantity: Int = 0
    @Published var cartArray: Item = []
    @Published var searchText: String = ""
    let apiGet: NetworkManager
    
    var filteredSearchList: Item {
        return items.filter {$0.item.localizedCaseInsensitiveContains(searchText)}
    }
    
    // MARK: - initialization
    init(apiGet: NetworkManager) {
        self.apiGet = apiGet
    }
    
    func getDataFromApi() {
        if let url = URL(string: "https://63fefa26c5c800a72388f5d2.mockapi.io/getRestaurantItems#") {
            self.apiGet.getData(requestUrl: url, resultType: Item.self) { result in
                DispatchQueue.main.async {
                    self.items.append(contentsOf: result)
                }
            }
        }
    }
}
