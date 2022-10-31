//
//  RoutineListView.swift
//  timer
//
//  Created by Anderson David on 8/22/22.
//

import SwiftUI

struct RoutineListView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var routines: FetchedResults<Routine>
    
    @State var creatingRoutine = false
    
    var body: some View {
        NavigationView {
            Group {
                if routines.count == 0 {
                    VStack {
                    Text("Tap the + button to create a new routine!")
                    Spacer()
                    }
                }
                else {
                    List(routines) { routine in
                        Text(routine.name ?? "")
                    }
                }
            }
            .navigationTitle("Routines")
            .toolbar {
                ToolbarItem() {
                    NavigationLink(isActive: $creatingRoutine, destination: {
                        CreateRoutineView(creatingRoutine: $creatingRoutine)
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
}

struct RoutineListView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineListView()
    }
}
