//
//  BlocksApp.swift
//  Blocks
//
//  Created by Matheus Dantas on 06/10/23.
//

import SwiftUI

@main
struct BlocksApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
