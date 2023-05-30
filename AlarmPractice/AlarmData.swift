//
//  AlarmData.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/16.
//

import Combine
import SwiftUI

final class AlarmData: ObservableObject {

    @Published var alarms: [Alarm]
    init(alarms: [Alarm]) {
        self.alarms = alarms
//        print("alarmdata init")
    }
    
    func removeAlarm(at offsets: IndexSet) {
//        print("DEBUG == ")
        self.alarms.remove(atOffsets: offsets)
    }
}

