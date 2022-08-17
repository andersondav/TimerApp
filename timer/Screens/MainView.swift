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
            ContentView()
                .tabItem {
                    Label("Routines", systemImage: "list.dash")
                }
            ContentView()
                .tabItem {
                    Label("Exercises", systemImage: "bicycle")
                }
            ContentView()
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
