//
//  EditReminderView.swift
//  Weirder Reminder
//
//  Created by Isaac Lee Jing Zhi on 10/8/21.
//

import SwiftUI

struct EditReminderView: View {
    
    @Binding var reminders: [Reminder]
    @Binding var index: Int

    @State var name = ""
    
    @Environment (\.presentationMode) var scenePhase
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("NAME")) {
                    TextField(reminders[index].name, text: $name)
                }
                
                Section(header: Text("Choose Tag")) {
                    
                }
              
                Section {
                    Button {
                        reminders[index].name = name
                        scenePhase.wrappedValue.dismiss()
                    } label: {
                        Text("Edit")
                        
                    }
                    Button {
                        scenePhase.wrappedValue.dismiss()
                    } label: {
                        Text("Dismiss")
                            .foregroundColor(.red)
                        
                    }
                }
            }
            .navigationTitle("Edit Reminder")
        }
    }
}


struct EditReminderView_Previews: PreviewProvider {
    static var previews: some View {
        EditReminderView(reminders: .constant([Reminder(name: "ACA", isCompleted: false, tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "ASa")]), index: .constant(0))
    }
}
