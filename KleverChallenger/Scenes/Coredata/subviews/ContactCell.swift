//
//  ContactCell.swift
//  KleverChallenger
//
//  Created by Helio Junior on 28/07/21.
//

import SwiftUI

struct ContactCell: View {
    
    @State var contact: Contact
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(contact.name ?? "-")
                    .font(.headline)
                Text(contact.cellphone ?? "")
                    .font(.subheadline)
            }
            Spacer()
            Button(action: {
                print("Press favorite")
            }) {
                Image(systemName: contact.isFavorite ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }.buttonStyle(PlainButtonStyle())
        }
        .frame(height: 60)
    }
}

struct ContactCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactCell(contact: Contact())
    }
}
