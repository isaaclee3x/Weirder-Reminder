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
    
    var tagColor: RGB
    var tagString: String

}

struct Tag: Identifiable, Codable, Equatable {
    var id = UUID()
    
    var tagColor: RGB
    var tagString: String
}

struct RGB: Identifiable, Codable, Equatable {
    var id = UUID()
    
    var r: String
    var g: String
    var b: String
    
}
