//
//  ContentView.swift
//  Weirder Reminder
//
//  Created by Isaac Lee Jing Zhi on 10/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var reminders: [Reminder]
    @Binding var tags: [Tag]
    
    @State var isSheetPresented = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(reminders) { reminder in
                    HStack {
                        Button {
                            let reminderIndex = reminders.firstIndex(of: reminder)!
                            reminders[reminderIndex].isCompleted.toggle()
                        } label: {
                            HStack {
                                Image(systemName: reminder.isCompleted ? "checkmark.circle" : "circle")
                                Text(reminder.name)
                                    .strikethrough(reminder.isCompleted)
                            }
                        }
                    }
                }
                .onDelete { indexSet in
                    reminders.remove(atOffsets: indexSet)
                }
                .onMove { source, destination in
                    reminders.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationTitle("Reminders")
            .navigationBarItems(leading: EditButton(), trailing: Button {
                isSheetPresented = true
            } label: {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $isSheetPresented) {
            NewReminderView(reminders: $reminders, tags: $tags)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(reminders: .constant([Reminder(name: "CA", isCompleted: false, tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "CA")]), tags: .constant([Tag(tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "DSD")]))
    }
}
