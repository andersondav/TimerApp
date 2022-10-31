//
//  CreateRoutineExerciseView.swift
//  timer
//
//  Created by Anderson David on 10/17/22.
//

import SwiftUI

enum FocusField: Hashable {
    case rest
    case exercise
    case editingEventLength(event: Event)
}

struct CreateRoutineExerciseView: View {
    @ObservedObject var createRoutineViewModel: CreateRoutineViewModel
    
    @State var presentExerciseAlert = false
    @State var presentRestAlert = false
    @State var addingExercises = false
    @State var presentEmptyWarning = false
    
    @FocusState var focusField: FocusField?
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                if createRoutineViewModel.events.count > 0 {
                    List($createRoutineViewModel.events, id: \.objectID) { ($event) in
                        EventCell(event: $event, focusField: _focusField) { event, newDuration in
                            if newDuration > 0 {
                                event.duration = Int64(newDuration)
                            }
                        }
                    }
                    .frame(height: metrics.size.height * 0.75)
                }
                else {
                    VStack {
                        Text("Add exercises to your routine!")
                        Spacer()
                    }
                }
                Spacer()
                HStack {
                    Toggle(isOn: $createRoutineViewModel.defaultExerciseLengthEnabled, label: {
                        Group {
                            Text("Default exercise duration:")
                            TextField("Exercise duration", value: $createRoutineViewModel.defaultExerciseLength, formatter: NumberFormatter())
                                .textFieldStyle(.roundedBorder)
                                .focused($focusField, equals: .exercise)
                                .frame(width: 50)
                                .multilineTextAlignment(.center)
                                .disabled(!createRoutineViewModel.defaultExerciseLengthEnabled)
                                .keyboardType(.numberPad)
                            Text("s")
                        }
                        .foregroundColor(createRoutineViewModel.defaultExerciseLengthEnabled ? .primary : .gray)
                    })
                    Button {
                        focusField = nil
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
                                .focused($focusField, equals: .rest)
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
                        focusField = nil
                        presentRestAlert = true
                    } label: {
                        Image(systemName: "questionmark")
                            .imageScale(.small)
                    }
                }
                .font(.body)
                Button {
                    focusField = nil
                    if createRoutineViewModel.events.count == 0 {
                        presentEmptyWarning = true
                    }
                } label: {
                    Text("Finish")
                }

                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem() {
                    Button {
                        focusField = nil
                        addingExercises = true
                    } label: {
                        Text("Add Exercise")
                    }

                }
            }
            .navigationTitle(createRoutineViewModel.name)
            .popover(isPresented: $addingExercises, content: {
                CreateRoutineAddExerciseView(createRoutineViewModel: createRoutineViewModel, addingExercises: $addingExercises)
            })
            .alert("Default Exercise Duration", isPresented: $presentExerciseAlert, actions: {}) {
                Text(StringVals.defaultExerciseDesc)
            }
            .alert("Rest Duration", isPresented: $presentRestAlert, actions: {}) {
                Text(StringVals.restDesc)
            }
            .alert("Empty routine", isPresented: $presentEmptyWarning, actions: {}) {
                Text("Please select at least one exercise for this routine")
            }
        }
    }
}

struct CreateRoutineExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRoutineExerciseView(createRoutineViewModel: CreateRoutineViewModel())
    }
}
