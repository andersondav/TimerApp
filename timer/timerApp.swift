//
//  timerApp.swift
//  timer
//
//  Created by Anderson David on 8/17/22.
//

import SwiftUI

@main
struct timerApp: App {
    @StateObject private var dataController = DataController.dataController
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataController.persistentContainer.viewContext)
        }
    }
}
