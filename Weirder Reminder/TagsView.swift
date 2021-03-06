//
//  TagsView.swift
//  Weirder Reminder
//
//  Created by Isaac Lee Jing Zhi on 13/8/21.
//

import SwiftUI

struct TagsView: View {
    
    @Binding var reminders: [Reminder]
    @Binding var tags: [Tag]
    
    @Binding var r: String
    @Binding var g: String
    @Binding var b: String
    @Binding var tagString: String
    
    @State var isSheetPresented = false
    
    @Environment(\.presentationMode) var scenePhase
    var body: some View {
        NavigationView {
            List {
                ForEach(tags) { tag in
                    HStack {
                        Button {
                            r = tag.tagColor.r
                            g = tag.tagColor.g
                            b = tag.tagColor.b
                            tagString = tag.tagString
                            scenePhase.wrappedValue.dismiss()
                        } label: {
                            HStack {
                                Circle()
                                    .fill(Color(red: Double(tag.tagColor.r)!, green: Double(tag.tagColor.g)!, blue: Double(tag.tagColor.b)!))
                                    .frame(height: 15)
                                    .position(x: 15, y: 12)
                                Text(tag.tagString)
                                    .frame(width: 310, height: 10, alignment: .leading)
                            }
                        }
                    }
                }
                .onDelete { indexSet in
                    tags.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Tags")
            .navigationBarItems(trailing: Button {
                isSheetPresented = true
            } label: {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $isSheetPresented, content: {
            NewTagView(tags: $tags, tagString: tagString)
        })
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(reminders: .constant([Reminder(name: "AC", isCompleted: false, tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "DSD")]), tags: .constant([Tag(tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "DSD", isChosen: false), Tag(tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "", isChosen: false)]), r: .constant("0"), g: .constant("1"), b: .constant("0"), tagString: .constant("BABA"))
    }
}
