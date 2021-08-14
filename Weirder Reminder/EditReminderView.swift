//
//  EditReminderView.swift
//  Weirder Reminder
//
//  Created by Isaac Lee Jing Zhi on 10/8/21.
//

import SwiftUI

struct EditReminderView: View {
    
    @Binding var reminders: [Reminder]
    @Binding var tags: [Tag]
    @Binding var index: Int
    
    @State var name = ""
    @State var r = "0"
    @State var g = "0"
    @State var b = "0"
    
    @State var tagString = ""
    @State var isSheetPresented = false
    
    @Environment (\.presentationMode) var scenePhase
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("NAME")) {
                    TextField(reminders[index].name, text: $name)
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
                        reminders[index].name = name
                        reminders[index].tagColor.r = r
                        reminders[index].tagColor.g = r
                        reminders[index].tagColor.b = r
                        reminders[index].tagString = tagString
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
        .sheet(isPresented: $isSheetPresented, content: {
            EditTagVIew(reminders: $reminders, tags: $tags, r: $r, g: $g, b: $b, tagString: $tagString)
        })
    }
}


struct EditReminderView_Previews: PreviewProvider {
    static var previews: some View {
        EditReminderView(reminders: .constant([Reminder(name: "ACA", isCompleted: false, tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "ASa")]), tags: .constant([Tag(tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "AS", isChosen: false)]), index: .constant(0))
    }
}
