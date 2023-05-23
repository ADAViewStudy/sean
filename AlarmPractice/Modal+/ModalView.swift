//
//  ModalView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/11.
//

import SwiftUI

struct ModalView: View {
    
    @State private var date = Date()
    @State var repeatDay: [RepeatDay] = []
    @State var isSnoozed: Bool = true
    @State var label: String = "알람"
    @Environment(\.dismiss) var dismiss
    @ObservedObject var alarmData: AlarmData
    
    var body: some View {
        NavigationView {
            VStack{
                DatePicker("Please enter a date", selection: $date,
                           displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .navigationTitle("알람 추가")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("저장") {
                            self.createAlarm()
                        }
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("취소", role: .cancel) {
                            self.dismiss()
                        }
                    }
                }//toolbar
                List {
                    AlarmAddRepeatCellView(repeatDay: $repeatDay)
                    AlarmAddLabelCellView(label: $label)
                    AlarmAddSoundCellView()
                    AlarmAddSnoozeCellView(isSnoozed: $isSnoozed)
                }
                .listStyle(.grouped)
            }
        }
    }//body
    
    private func createAlarm() {
        let newAlarm = Alarm(
            id: UUID(),
            date: date,
            label: label,
            repeatDay: repeatDay,
            isActive: true,
            isSnooze: isSnoozed
        )
        
        self.alarmData.alarms.append(newAlarm)
        //정렬
        self.alarmData.alarms = self.alarmData.alarms.sorted(by: {$0.date < $1.date})
        dismiss()
    }
}


struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(alarmData: AlarmData(alarms: []))
            .tint(.orange)
    }
}
