//
//  Alarm.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/14.
//
import SwiftUI

struct Alarm: Hashable, Codable, Identifiable {
    
    let id: UUID
    var date: Date
    var label: String
    var repeatDay: [Int]
    var isActive: Bool
    var isSnooze: Bool
    
    var repeats: String{
        guard repeatDay.count > 0 else {return "" }
        return repeatDay.repeats
    }
    
    init(id: UUID, date: Date, label: String, repeatDay: [RepeatDay], isActive: Bool, isSnooze: Bool) {
        self.id = UUID()
        self.date = date
        self.label = label
        self.repeatDay = repeatDay.map { $0.rawValue }
        self.isActive = isActive
        self.isSnooze = isSnooze
    }
    
}

extension Alarm {
    static var arr: [Alarm] = []
}
