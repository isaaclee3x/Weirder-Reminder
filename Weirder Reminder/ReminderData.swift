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
    
    let sampleReminders = [Reminder(name: "CA", isCompleted: false, tagColor: RGB(r: "0", g: "1", b: "0"), tagString: "CA")]
    
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

class TagsData: ObservableObject {
    @Published var tags: [Tag] = []
    
    let sampletags = [Tag(tagColor: RGB(r: "0", g: "0", b: "0"), tagString: "Default")]
    
    func getArchiveURL() -> URL {
        let plistName = "Tags.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedTags = try? propertyListEncoder.encode(tags)
        try? encodedTags?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finaltags: [Tag]!
        
        if let retrivedTagData = try? Data(contentsOf: archiveURL),
            let decdodedTags = try? propertyListDecoder.decode([Tag].self, from: retrivedTagData) {
            finaltags = decdodedTags
        } else {
            finaltags = sampletags
        }
        
        tags = finaltags
    }
}

