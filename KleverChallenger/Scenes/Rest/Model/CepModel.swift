//
//  CepModel.swift
//  KleverChallenger
//
//  Created by Helio Junior on 29/07/21.
//

import Foundation

struct CepModel: Decodable {
    let cep: String
    let logradouro: String?
    let complemento: String?
    let bairro: String?
    let localidade: String?
    let uf: String?
}
