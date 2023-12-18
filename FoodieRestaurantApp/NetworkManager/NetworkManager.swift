//
//  NetworkManager.swift
//  FoodieRestaurantApp
//
//  Created by Pranjal on 18/12/2023.
//

import Foundation

struct NetworkManager {
    func getData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler: @escaping(_ result: T)->Void) {
        URLSession.shared.dataTask(with: requestUrl) { responseData, httpUrlResponse, error in
            if (error == nil && responseData != nil && responseData?.count != nil) {
                let decoder = JSONDecoder()
                guard let responseData = responseData else {return}
                do {
                    let result = try  decoder.decode(T.self, from: responseData)
                    completionHandler(result)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
