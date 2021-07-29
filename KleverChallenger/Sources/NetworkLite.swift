//
//  NetworkLite.swift
//  KleverChallenger
//
//  Created by Helio Junior on 29/07/21.
//

import Foundation

//Custumo deixar a BASE_URL no "BuiderSettings", mas para simplicidade vou deixar aqui!
let BASE_URL = "https://viacep.com.br/ws"

//Essa camada de Networking é apenas para atender a esta demanda.
final class Network {
    
    static func get(url: URL, completion: @escaping (Data?, String?) -> Void) {
        debugPrint("==> URL: \(url.absoluteString)")
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                completion(nil, err.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(nil, "Serviço indisponível!")
                return
            }
            
            completion(data, nil)
        }.resume()
    }
}
