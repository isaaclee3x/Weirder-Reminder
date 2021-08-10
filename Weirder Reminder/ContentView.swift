//
//  ContentView.swift
//  Weirder Reminder
//
//  Created by Isaac Lee Jing Zhi on 10/8/21.
//

import SwiftUI

struct ContentView: View {
    
//    State vars here
    @State private var reminders = [Reminder(name: "CACA", isCompleted: false)]
    
//    Start of body
    var body: some View {
//        Start of NavigationView
        NavigationView {
//            Start of List
            List {
//                Start of ForEach
//                This is so that we can implement the onDelete and onMove functions
                ForEach(reminders) { reminder in
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
