//
//  Weirder_ReminderApp.swift
//  Weirder Reminder
//
//  Created by Isaac Lee Jing Zhi on 10/8/21.
//

import SwiftUI

@main
struct Weirder_ReminderApp: App {
    
    @ObservedObject var reminderData = ReminderData()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView(reminders: $reminderData.reminders)
                .onAppear {
                    reminderData.load()
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive {
                        reminderData.save()
                    }
                }
        }
    }
}
