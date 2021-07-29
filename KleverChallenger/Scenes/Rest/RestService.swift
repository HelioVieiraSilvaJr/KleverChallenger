//
//  RestService.swift
//  KleverChallenger
//
//  Created by Helio Junior on 29/07/21.
//

import Foundation

final class RestService {
    
    func getCep(_ cep: String, completion: @escaping (Result<CepModel, APIError>) -> Void) {
        guard let url = URL(string: String(format: "\(BASE_URL)/\(cep)/json", BASE_URL)) else {
            completion(.failure(.badURL))
            return
        }
        Network.get(url: url) { (data, error) in
            guard error == nil else {
                completion(.failure(.errorUnknown(error?.localizedCapitalized)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let model = try JSONDecoder().decode(CepModel.self, from: data)
                completion(.success(model))
            } catch let err {
                completion(.failure(.errorUnknown(err.localizedDescription)))
            }
        }
    }
}
