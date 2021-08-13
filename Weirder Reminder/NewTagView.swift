//
//  NewTagView.swift
//  Weirder Reminder
//
//  Created by Isaac Lee Jing Zhi on 13/8/21.
//

import SwiftUI

struct NewTagView: View {
    
    @Binding var tags: [Tag]
    
    @State var tagString: String
    @State var r = "0"
    @State var g = "0"
    @State var b = "0"
    
    @State var isAlertPresented1 = false
    @State var isAlertPresented2 = false
    
    @Environment(\.presentationMode) var scenePhase
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Tag Name")) {
                    TextField("Tag Name", text: $tagString)
                        .disableAutocorrection(true)
                }
                
                Section(header: Text("Tag Colors")) {
                    TextField("Red Color", text: $r)
                        .disableAutocorrection(true)
                    TextField("Green Color", text: $g)
                        .disableAutocorrection(true)
                    TextField("Blue Color", text: $b)
                        .disableAutocorrection(true)
                    HStack {
                        Circle()
                            .fill(Color.init(red: Double(r) ?? 0, green: Double(g) ?? 0, blue: Double(b) ?? 0))
                            .frame(height: 15)
                            .offset(x: -55)
                        Text(tagString)
                            .frame(width: 200, height: 10, alignment: .leading)
                            .offset(x: -90)
                    }
                }
                
                Section {
                    Button {
                        let alphanumChar = CharacterSet.alphanumerics
                        let nonAlphanumChar = CharacterSet.alphanumerics.inverted
                        
                        if r.rangeOfCharacter(from: alphanumChar) != nil || r.rangeOfCharacter(from: nonAlphanumChar) != nil || g.rangeOfCharacter(from: alphanumChar) != nil || g.rangeOfCharacter(from: nonAlphanumChar) != nil || b.rangeOfCharacter(from: alphanumChar) != nil || b.rangeOfCharacter(from: nonAlphanumChar) != nil {
                            isAlertPresented1 = true
                        }
                        else if tagString == "" {
                            tagString = "Blank"
                            
                        }
                        else if Double(r)!
                                    > 1 || Double(g)! > 1 || Double(b)! > 1 {
                            isAlertPresented2 = true
                        }
                        
                        tags.append(Tag(tagColor: RGB(r: r, g: g, b: b), tagString: tagString, isChosen: false))
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
                .navigationTitle("New Tag")
            }
            .alert(isPresented: $isAlertPresented1) {
                Alert.init(title: Text("Error"), message: Text("The can only be numbers"), dismissButton: Alert.Button.destructive(Text("Dismiss")))
            }
            
            .alert(isPresented: $isAlertPresented2) {
                Alert.init(title: Text("Error"), message: Text("Number Values are greater than 1"), dismissButton: Alert.Button.destructive(Text("Dismiss")))
            }
        }
    }
}

struct NewTagView_Previews: PreviewProvider {
    static var previews: some View {
        NewTagView(tags: .constant([Tag(tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "CA", isChosen: false)]), tagString: "MA")
    }
}
