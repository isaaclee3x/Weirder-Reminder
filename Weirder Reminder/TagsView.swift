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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(reminders: .constant([Reminder(name: "AC", isCompleted: false, tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "DSD")]), tags: .constant([Tag(tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "DSD")]))
    }
}
