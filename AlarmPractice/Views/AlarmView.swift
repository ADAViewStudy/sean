//
//  AlarmView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/16.
//


import SwiftUI

struct AlarmView : View {
  @ObservedObject var alarmData: AlarmData
  let alarm: Alarm
  
  var alarmIndex: Int {
    alarmData.alarms.firstIndex(where: { $0.id == alarm.id})!
  }
  
  let timeFormat: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm"
    return formatter
  }()
  
  let meridiemFormat: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "a"
    return formatter
  }()
  
  var body: some View {
    Toggle(isOn: $alarmData.alarms[alarmIndex].isActive) {
      VStack(alignment: .leading, spacing: 0) {
          HStack(alignment: .firstTextBaseline, spacing: -2.0){
              Text("\(self.alarm.date, formatter: self.meridiemFormat)")
                  .font(.system(size: 30))
              
              Text("\(self.alarm.date, formatter: self.timeFormat)")
                  .font(.system(size: 50))
                  .fontWeight(.light)
          }
          
        HStack(spacing: 0) {
          Text(self.alarm.label)
            .font(.subheadline)
          
          if self.alarm.repeats != "" {
            Text(", \(self.alarm.repeats)")
              .font(.subheadline)
          }
        }
      }
    }
    .tint(Color.green)
  }
}

//struct AlarmView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlarmView(alarmData: AlarmData(alarms: <#T##[Alarm]#>), alarm: <#T##Alarm#>)
//            .tint(.orange)
//    }
//}
