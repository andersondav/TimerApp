//
//  MainView.swift
//  timer
//
//  Created by Anderson David on 8/17/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            RoutineListView()
                .tabItem {
                    Label("Routines", systemImage: "list.dash")
                }
            ExerciseListView()
                .tabItem {
                    Label("Exercises", systemImage: "bicycle")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
