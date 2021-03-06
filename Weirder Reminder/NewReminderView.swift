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
    
    @State var isSheetPresented = false
    @Environment(\.presentationMode) var scenePhase
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Name", text: $name)
                }
                
                Section(header: Text("Choose Tag")) {
                    Button {
                        isSheetPresented = true
                    } label: {
                        HStack {
                            Text("Choose Tag")
                                .foregroundColor(.gray)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .offset(x: 220)
                        }
                    }
                }
                Section {
                    HStack {
                        Text("Chosen Tag: ")
                            .bold()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Circle()
                            .fill(Color.init(red: Double(r)!, green: Double(g)!, blue: Double(b)!))
                            .frame(height: 15)
                            .offset(x: 20)
                        Text(tagString)
                            .frame(width: 150, height: 30, alignment: .leading)
                    }
                }
                
                Section {
                    Button {
                        reminders.append(Reminder(name: name, isCompleted: false, tagColor: RGB(r: r, g: g, b: b), tagString: tagString))
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
            .navigationTitle("New Reminder")
        }
        .sheet(isPresented: $isSheetPresented) {
            TagsView(reminders: $reminders, tags: $tags, r: $r, g: $g, b: $b, tagString: $tagString)
        }
    }
}

struct NewReminderView_Previews: PreviewProvider {
    static var previews: some View {
        NewReminderView(reminders: .constant([Reminder(name: "CA", isCompleted: false, tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "CA")]), tags: .constant([Tag(tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "DSD", isChosen: false)]))
    }
}
