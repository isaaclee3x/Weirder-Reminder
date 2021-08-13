//
//  NewReminderView.swift
//  Weirder Reminder
//
//  Created by Isaac Lee Jing Zhi on 10/8/21.
//

import SwiftUI

struct NewReminderView: View {

    @Binding var reminders: [Reminder]
    
    @State var name = ""
    
    @Environment(\.presentationMode) var scenePhase
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Name", text: $name)
            }
            Section {

                Button {
                    reminders.append(Reminder(name: name, isCompleted: false, tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "ASA"))
                    scenePhase.wrappedValue.dismiss()
                } label: {
                    Text("Save")
                }
                
                Button {
                    scenePhase.wrappedValue.dismiss()
                } label: {
                    Text("Dismiss")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct NewReminderView_Previews: PreviewProvider {
    static var previews: some View {
        NewReminderView(reminders: .constant([Reminder(name: "CA", isCompleted: false, tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "CA")]))
    }
}
