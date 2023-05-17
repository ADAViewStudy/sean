//
//  AlarmAddSnoozeCellView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/15.
//

import SwiftUI

struct AlarmAddSnoozeCellView : View {
  @Binding var isSnoozed: Bool
  
  var body: some View {
    Toggle(isOn: $isSnoozed) {
      Text("다시 알림")
    }
    .tint(Color.green)
  }
}
