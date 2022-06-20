//
//  APIServiceProtocol.swift
//  CatSwiftUI
//
//  Created by Xiangli on 6/20/22.
//

import Foundation

protocol APIServiceProtocol {
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void)
}
