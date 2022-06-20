//
//  NetworkService.swift
//  CatSwiftUI
//
//  Created by Xiangli on 6/19/22.
//

import Foundation
import SwiftUI

class BreedManager: ObservableObject {
    
    @Published var breeds = [Breed]()
    @Published var isLoading :Bool = false
    @Published var errorMessage: String? = nil
    
    let apiService: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.apiService = service
        fetchAllBreeds()
    }
    
    func fetchAllBreeds() {
        isLoading = true
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")

        apiService.fetchBreeds(url: url){[unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result{
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .success(let breeds):
                    self.breeds = breeds
                }
            }
        }
    }
}
