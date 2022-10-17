//
//  CreateRoutineExerciseView.swift
//  timer
//
//  Created by Anderson David on 10/17/22.
//

import SwiftUI

struct CreateRoutineExerciseView: View {
    @ObservedObject var createRoutineViewModel: CreateRoutineViewModel
    
    @State var presentExerciseAlert = false
    @State var presentRestAlert = false
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                List(createRoutineViewModel.events, id: \.id, rowContent: { (event) in
                    Text(event.displayName ?? "Unknown name")
                }).frame(height: metrics.size.height * 0.75)
                Spacer()
                HStack {
                    Toggle(isOn: $createRoutineViewModel.defaultExerciseLengthEnabled, label: {
                        Group {
                            Text("Default exercise duration:")
                            TextField("Exercise duration", value: $createRoutineViewModel.defaultExerciseLength, formatter: NumberFormatter())
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 50)
                                .multilineTextAlignment(.center)
                                .disabled(!createRoutineViewModel.defaultExerciseLengthEnabled)
                                .keyboardType(.numberPad)
                            Text("s")
                        }
                        .foregroundColor(createRoutineViewModel.defaultExerciseLengthEnabled ? .primary : .gray)
                    })
                    Button {
                        presentExerciseAlert = true
                    } label: {
                        Image(systemName: "questionmark")
                            .imageScale(.small)
                    }
                }
                .font(.body)
                HStack {
                    Toggle(isOn: $createRoutineViewModel.restEnabled, label: {
                        Group {
                            Text("Rest duration:")
                            TextField("Rest duration", value: $createRoutineViewModel.restLength, formatter: NumberFormatter())
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 50)
                                .multilineTextAlignment(.center)
                                .disabled(!createRoutineViewModel.restEnabled)
                                .keyboardType(.numberPad)
                            Text("s")
                        }
                        .foregroundColor(createRoutineViewModel.restEnabled ? .primary : .gray)
                    })
                    Button {
                        presentRestAlert = true
                    } label: {
                        Image(systemName: "questionmark")
                            .imageScale(.small)
                    }
                }
                .font(.body)
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem() {
                    NavigationLink {
                    } label: {
                        Text("Add exercises")
                    }
                }
            }
            .alert("Default Exercise Duration", isPresented: $presentExerciseAlert, actions: {}) {
                Text(StringVals.defaultExerciseDesc)
            }
            .alert("Rest Duration", isPresented: $presentRestAlert, actions: {}) {
                Text(StringVals.restDesc)
            }
        }
    }
}

struct CreateRoutineExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRoutineExerciseView(createRoutineViewModel: CreateRoutineViewModel())
    }
}
