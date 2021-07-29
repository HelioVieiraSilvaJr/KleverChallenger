//
//  GRPCView.swift
//  KleverChallenger
//
//  Created by Helio Junior on 28/07/21.
//

import SwiftUI

struct GRPCView: View {
    var body: some View {
        NavigationView {
            Form {
                Text("""
            Não encontrei um servidor gRPC free disponível na internet para fazer a integração! Por isso fiz um exemplo simples de consumos usando Rest, disponível na Tab Central!
            
            Mas não teria muito segredo, eu iria adicionar a instancia do "Client" (gRPC) no Repository da Cena e consumiria Ele, similar ao exemplo do Rest que consome uma instancia do Service.
            """)
                
            }
            .navigationTitle("gRPC")
        }
    }
}

struct GRPCView_Previews: PreviewProvider {
    static var previews: some View {
        GRPCView()
    }
}
