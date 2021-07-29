//
//  ErrorAPI.swift
//  KleverChallenger
//
//  Created by Helio Junior on 29/07/21.
//

import Foundation

enum APIError: Error {
    case badURL
    case noResponse
    case invalidStatusCode(Int)
    case noData
    case invalidJSON
    case errorUnknown(String?)
    
    var errorMessage: String {
        switch self {
        case .badURL:
            return "URL inválida"
        default:
            return ""
        }
    }
}
