//
//  NewReminderView.swift
//  Weirder Reminder
//
//  Created by Isaac Lee Jing Zhi on 10/8/21.
//

import SwiftUI

struct NewReminderView: View {
    
//    Binding vars here
    @Binding var reminders: [Reminder]
    
//    State vars here
    @State var name = ""
    
//    Environment Values here
    @Environment(\.presentationMode) var scenePhase
    
    var body: some View {
//        Start of body
        Form {
//            Start of Form
            Section(header: Text("Name")) {
//                Start of Section
                TextField("Name", text: $name)
            }
//            End of Section
            Section {
//                Start of Section
                Button {
//                    Start of Button
//                    Start of Action
                    reminders.append(Reminder(name: name, isCompleted: false))
                    scenePhase.wrappedValue.dismiss()
//                    End of Action
                } label: {
//                    Start of Label
                    Text("Save")
//                    End of Label
//                    End of Button
                }
                
                Button {
//                    Start of Button
//                    Start of Action
                    
                    scenePhase.wrappedValue.dismiss()
//                    End of Action
                } label: {
//                    Start of Label
                    Text("Dismiss")
                        .foregroundColor(.red)
//                    End of Label
//                    End of Button
                }
//                End of Section
            }
//            End of Form
        }
//        End of Body
    }
}

struct NewReminderView_Previews: PreviewProvider {
    static var previews: some View {
        NewReminderView(reminders: .constant([Reminder(name: "DA", isCompleted: false)]))
    }
}
