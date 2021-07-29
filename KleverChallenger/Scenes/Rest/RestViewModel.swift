//
//  RestViewModel.swift
//  KleverChallenger
//
//  Created by Helio Junior on 29/07/21.
//

import Foundation

final class RestViewModel: ObservableObject {
    
    // MARK: Properties
    private let repository: RestRepository
    @Published var inputCep: String = ""
    @Published var cepModel: CepModel?
    @Published var messageError: String?
    
    init(repository: RestRepository = RestRepository()) {
        self.repository = repository
    }
    
    // MARK: Methods
    func findCep() {
        guard inputCep.count == 8 else {
            messageError = "Esse CEP não é válido!"
            cepModel = nil
            return
        }
        repository.find(cep: inputCep) { [weak self] cepModel in
            self?.cepModel = cepModel
        } onFailure: { [weak self] error in
            self?.messageError = "Verifique se o CEP digitado está correto e tente novamente!"
        }
    }
}
