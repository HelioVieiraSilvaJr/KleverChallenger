//
//  RestView.swift
//  KleverChallenger
//
//  Created by Helio Junior on 28/07/21.
//

import SwiftUI

struct RestView: View {
    
    @ObservedObject var viewModel = RestViewModel()
    
    var body: some View {
        
        Form {
            Section(header: Text("Informe um CEP")) {
                TextField("00000-000", text: $viewModel.inputCep)
                Button("Buscar") {
                    viewModel.findCep()
                }
            }
            
            if viewModel.cepModel != nil {
                Section(header: Text("Endereço encotrado:")) {
                    Text(viewModel.cepModel?.logradouro ?? "").font(.caption)
                    Text(viewModel.cepModel?.complemento ?? "").font(.caption)
                    Text(viewModel.cepModel?.bairro ?? "").font(.caption)
                    Text(viewModel.cepModel?.localidade ?? "").font(.caption)
                    Text(viewModel.cepModel?.uf ?? "").font(.caption)
                }
            } else {
                Text(viewModel.messageError ?? "")
                    .foregroundColor(.red)
                    .font(.caption2)
            }
        }

    }
}

struct RestView_Previews: PreviewProvider {
    static var previews: some View {
        RestView()
    }
}
