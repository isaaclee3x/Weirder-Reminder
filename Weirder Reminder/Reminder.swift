//
//  Reminder.swift
//  Weirder Reminder
//
//  Created by Isaac Lee Jing Zhi on 10/8/21.
//

import Foundation


struct Reminder: Identifiable, Equatable, Codable {
    var id = UUID()
    
    var name: String
    var isCompleted: Bool
    
    
}
