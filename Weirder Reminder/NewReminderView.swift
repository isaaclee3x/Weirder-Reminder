//
//  NewReminderView.swift
//  Weirder Reminder
//
//  Created by Isaac Lee Jing Zhi on 10/8/21.
//

import SwiftUI

struct NewReminderView: View {

    @Binding var reminders: [Reminder]
    @Binding var tags: [Tag]
    
    @State var name = ""
    
    @State var r = "0"
    @State var g = "0"
    @State var b = "0"
    @State var tagString = ""
    
    @Environment(\.presentationMode) var scenePhase
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Name", text: $name)
            }
            
            Section(header: Text("Choose Tag")) {
                NavigationLink(
                    destination: TagsView(reminders: $reminders, tags: $tags, r: $r, g: $g, b: $b, tagString: $tagString)) {
                        Text("Choose Tags")
                    }
                HStack {
                    Text("Chosen Tag: ")
                        .bold()
                    Circle()
                        .fill(Color.init(red: Double(r)!, green: Double(g)!, blue: Double(b)!))
                        .frame(height: 15)
                        .offset(x: -80)
                    Text(tagString)
                }
            }
            
            Section {
                Button {
                    reminders.append(Reminder(name: name, isCompleted: false, tagColor: RGB(r: r, g: g, b: b), tagString: "ASA"))
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
        NewReminderView(reminders: .constant([Reminder(name: "CA", isCompleted: false, tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "CA")]), tags: .constant([Tag(tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "DSD", isChosen: false)]))
    }
}
