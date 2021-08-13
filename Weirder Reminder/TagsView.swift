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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tags) { tag in
                    HStack {
                        Button {
                            let tagIndex = tags.firstIndex(of: tag)!
                            tags[tagIndex].isChosen.toggle()
                        } label: {
                            HStack {
                                Circle()
                                    .fill(Color(red: Double(tag.tagColor.r)!, green: Double(tag.tagColor.g)!, blue: Double(tag.tagColor.b)!))
                                    .frame(height: 15)
                                    .offset(x: -120)
                                Text(tag.tagString)
                                    .offset(x: -240)
                                Image(systemName: tag.isChosen ? "checkmark.circle" : "circle")
                                    .offset(x: -20)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Tags")
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(reminders: .constant([Reminder(name: "AC", isCompleted: false, tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "DSD")]), tags: .constant([Tag(tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "DSD", isChosen: false)]))
    }
}
