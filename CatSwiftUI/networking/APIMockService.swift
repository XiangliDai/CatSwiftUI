//
//  APIMockService.swift
//  CatSwiftUI
//
//  Created by Xiangli on 6/20/22.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    var result: Result<[Breed], APIError>

    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void){
        completion(result)
    }

}
