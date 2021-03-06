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
   
    @State var isSheetPresented1 = false
    @State var isSheetPresented2 = false

    @State var index = 0
    
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
                                Circle()
                                    .fill(Color.init(red: Double(reminder.tagColor.r)!, green: Double(reminder.tagColor.g)!, blue: Double(reminder.tagColor.b)!))
                                    .frame(height: 15)
                                Image(systemName: reminder.isCompleted ? "checkmark.circle" : "circle")
                                Text(reminder.name)
                                    .strikethrough(reminder.isCompleted)
                                    .frame(width: 270, height: 20, alignment: .leading)
                                Button {
                                    let reminderIndex = reminders.firstIndex(of: reminder)!
                                    index = reminderIndex
                                    isSheetPresented2 = true
                                } label: {
                                    Image(systemName: "ellipsis.circle")
                                        .position(y: 10)
                                }
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
                isSheetPresented1 = true
            } label: {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $isSheetPresented1) {
            NewReminderView(reminders: $reminders, tags: $tags)
        }
        .sheet(isPresented: $isSheetPresented2, content: {
            EditReminderView(reminders: $reminders, tags: $tags, index: $index)
        })

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(reminders: .constant([Reminder(name: "CA", isCompleted: false, tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "CA")]), tags: .constant([Tag(tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "DSD", isChosen: false)]))
    }
}
