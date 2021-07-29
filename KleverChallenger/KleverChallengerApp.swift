//
//  KleverChallengerApp.swift
//  KleverChallenger
//
//  Created by Helio Junior on 28/07/21.
//

import SwiftUI

@main
struct KleverChallengerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabbarBase()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
