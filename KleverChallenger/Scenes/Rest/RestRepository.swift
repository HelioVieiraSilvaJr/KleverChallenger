//
//  Repository.swift
//  KleverChallenger
//
//  Created by Helio Junior on 29/07/21.
//

import Foundation

final class RestRepository {
    
    // MARK: Properties
    private let service: RestService
    
    // MARK: Inicialization
    init(service: RestService = RestService()) {
        self.service = service
    }
    
    // MARK: Methods
    func find(cep: String, onSuccess: @escaping (CepModel) -> Void, onFailure: @escaping (String) -> Void) {
        service.getCep(cep) { result in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onFailure(error.localizedDescription)
            }
        }
    }
}
