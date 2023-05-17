//
//  AlarmLabelView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/15.
//

import SwiftUI

struct AlarmLabelView : View {
  @Binding var label: String
  
  var body: some View {
    Text(label)
      .textFieldStyle(.roundedBorder)
      .navigationBarTitle(Text("Label"), displayMode: .inline)
  }
}


