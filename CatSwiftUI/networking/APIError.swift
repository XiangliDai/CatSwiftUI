//
//  APIError.swift
//  CatSwiftUI
//
//  Created by Xiangli on 6/19/22.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
   
    case badURL
    case badResponse(statusCode:Int?)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var description: String {
        switch self{
            case .unknown: return "unknown error"
            case .badURL: return "invalid URL"
            case .url(let error):
                  return error?.localizedDescription ?? "url session error"
            case .parsing(let error):
                  return "parsing error \(error?.localizedDescription ?? "")"
            case .badResponse(statusCode: let statusCode):
            return "bad response with status code \(String(describing: statusCode))"
        }
    }
    
    var localizedDescription: String {
            // user feedback
            switch self {
            case .badURL, .parsing, .unknown:
                return "Sorry, something went wrong."
            case .badResponse(_):
                return "Sorry, the connection to our server failed."
            case .url(let error):
                return error?.localizedDescription ?? "Something went wrong."
            }
        }
    
}
