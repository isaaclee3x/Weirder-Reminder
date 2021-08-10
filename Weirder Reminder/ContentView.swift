//
//  ContentView.swift
//  Weirder Reminder
//
//  Created by Isaac Lee Jing Zhi on 10/8/21.
//

import SwiftUI

struct ContentView: View {
    
//    Binding vars here
    @Binding var reminders: [Reminder]
    
//    State vars here
    @State var isSheetPresented = false
    
//    Start of body
    var body: some View {
//        Start of NavigationView
        NavigationView {
//            Start of List
            List {
//                Start of ForEach
//                This is so that we can implement the onDelete and onMove functions
                ForEach(reminders) { reminder in
                    Button {
//                        Start of Button
//                        Start of Action
                        let reminderIndex = reminders.firstIndex(of: reminder)!
                        reminders[reminderIndex].isCompleted.toggle()
//                        End of Action
                    } label: {
//                       Start of Label
                        HStack {
//                            Start of HStack
                            Image(systemName: reminder.isCompleted ? "checkmark.circle" : "circle")
                            Text(reminder.name)
                                .strikethrough(reminder.isCompleted)
//                            End of HStack
                        }
//                     End of Label & End of Button
                    }
//                    End of ForEach
                }
                .onDelete { indexSet in
//                    Start of onDelete
                    reminders.remove(atOffsets: indexSet)
//                    End of onDelete
                }
                .onMove { source, destination in
//                    Start of onMove
                    reminders.move(fromOffsets: source, toOffset: destination)
//                    End of onMove
                }
//                End of List
            }
            .navigationTitle("Reminders")
            .navigationBarItems(leading: EditButton(), trailing: Button {
//                Start of Action
                isSheetPresented = true
//                End of Action
            } label: {
//                Start of Label
                Image(systemName: "plus")
//                End of Label
            })
//            End of NavigationView
        }
        .sheet(isPresented: $isSheetPresented) {
            NewReminderView(reminders: $reminders)
        }
//    End of Body
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(reminders: .constant([Reminder(name: "CA", isCompleted: false)]))
    }
}
