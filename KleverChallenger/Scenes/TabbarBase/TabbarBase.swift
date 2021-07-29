//
//  TabbarBase.swift
//  KleverChallenger
//
//  Created by Helio Junior on 28/07/21.
//

import SwiftUI
import CoreData

struct TabbarBase: View {
    
    @State var selectedView = 1
    
    var body: some View {
        TabView(selection: $selectedView) {
            CoredataView()
            .padding()
            .tabItem {
                Label("Coredata", systemImage: "server.rack")
            }
            .tag(1)
            
            RestView()
            .padding()
            .tabItem {
                Label("Rest", systemImage: "lifepreserver")
            }
            .tag(2)
            
            GRPCView()
            .padding()
            .tabItem {
                Label("gRPC", systemImage: "lifepreserver.fill")
            }
            .tag(3)
        }
    }
}

struct TabbarBase_Previews: PreviewProvider {
    static var previews: some View {
        TabbarBase().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
