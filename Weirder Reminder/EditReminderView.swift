//
//  EditReminderView.swift
//  Weirder Reminder
//
//  Created by Isaac Lee Jing Zhi on 10/8/21.
//

import SwiftUI

struct EditReminderView: View {
    
    //    Binding vars here
    @Binding var reminders: [Reminder]
    @Binding var index: Int
    
    //    State vars here
    @State var name = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("NAME")) {
                    TextField(reminders[index].name, text: $name)
                }
            }
            .navigationTitle("Edit Reminder")
        }
    }
}


struct EditReminderView_Previews: PreviewProvider {
    static var previews: some View {
        EditReminderView(reminders: .constant([Reminder(name: "Ca", isCompleted: false)]), index: .constant(0))
    }
}
