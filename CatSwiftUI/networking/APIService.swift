//
//  APIService.swift
//  CatSwiftUI
//
//  Created by Xiangli on 6/19/22.
//

import Foundation
import SwiftUI

struct APIService: APIServiceProtocol{
    
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void){
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
    
        let task = URLSession.shared.dataTask(with: url) { data,response, error in
                if let error = error as? URLError {
                    completion(Result.failure(APIError.url(error)))
                } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
                } else if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let breeds = try decoder.decode([Breed].self, from: data)
                        completion(Result.success(breeds))
                    } catch {
                        completion(Result.failure(APIError.parsing(error as? DecodingError)))
                    }
                }
                
            }
            task.resume()
    }
}
