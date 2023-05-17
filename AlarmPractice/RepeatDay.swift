//
//  RepeatDay.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/15.
//

import SwiftUI

enum RepeatDay: Int {
  case sunday = 0
  case monday
  case tuesday
  case wednesday
  case thursday
  case friday
  case saturday
  
  var fullName: String {
    switch self {
    case .sunday: return "일요일마다"
    case .monday: return "월요일마다"
    case .tuesday: return "화요일마다"
    case .wednesday: return "수요일마다"
    case .thursday: return "목요일마다"
    case .friday: return "금요일마다"
    case .saturday: return "토요일마다"
    }
  }
  
  var shortName: String {
    switch self {
    case .sunday: return "일"
    case .monday: return "월"
    case .tuesday: return "화"
    case .wednesday: return "수"
    case .thursday: return "목"
    case .friday: return "금"
    case .saturday: return "토"
    }
  }

}

extension Array where Element == Int {
  var repeats: String {
    let sorted = self.sorted()
    if sorted == [0, 6] { return "주말" }
    if sorted == [1 ,2, 3, 4, 5] { return "주중" }
    if sorted == [0, 1, 2, 3, 4, 5, 6] { return "매일" }
    
    var returnedDay = ""
    for i in sorted {
      guard let day = RepeatDay(rawValue: i)?.shortName else { return returnedDay }
      returnedDay += "\(day) "
    }
    
    return returnedDay
  }
}

extension Array where Element == RepeatDay {
  var repeats: String {
    guard self.count > 0 else { return "" }
    
    let rawValues = self.map { $0.rawValue }
    return rawValues.repeats
  }
}
