//
//  Cart1_0App.swift
//  Cart1.0
//
//  Created by Axel Mitura on 21/09/2022.
//

import SwiftUI

@main
struct CartApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
