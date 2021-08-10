//
//  ReminderData.swift
//  Weirder Reminder
//
//  Created by Isaac Lee Jing Zhi on 10/8/21.
//

import Foundation
import SwiftUI

class ReminderData: ObservableObject {
    @Published var reminders: [Reminder] = []
    
    let sampleReminders = [Reminder(name: "Testing", isCompleted: false)]
    
    func getArchiveURL() -> URL {
        let plistName = "Reminders.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedReminders = try? propertyListEncoder.encode(reminders)
        try? encodedReminders?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalReminders: [Reminder]!
        
        if let retrievedReminderData = try? Data(contentsOf: archiveURL),
            let decodedReminders = try? propertyListDecoder.decode([Reminder].self, from: retrievedReminderData) {
            finalReminders = decodedReminders
        } else {
            finalReminders = sampleReminders
        }
        
        reminders = finalReminders
    }
}
