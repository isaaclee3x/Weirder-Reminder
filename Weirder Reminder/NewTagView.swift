//
//  NewTagView.swift
//  Weirder Reminder
//
//  Created by Isaac Lee Jing Zhi on 13/8/21.
//

import SwiftUI

struct NewTagView: View {
    
    @Binding var tags: [Tag]
    var body: some View {
        Form {
            
        }
    }
}

struct NewTagView_Previews: PreviewProvider {
    static var previews: some View {
        NewTagView(tags: .constant([Tag(tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "CA", isChosen: false)]))
    }
}
