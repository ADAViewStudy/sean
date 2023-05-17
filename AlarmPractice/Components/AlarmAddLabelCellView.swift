//
//  AlarmAddLabelCellView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/15.
//

import SwiftUI

struct AlarmAddLabelCellView : View {
    @Binding var label: String 
  
  var body: some View {
      HStack {
        Text("레이블")
        Spacer()
          TextField("알람", text: $label)
              .fixedSize()
              .frame(alignment: .trailing)
              .onAppear {
                  UITextField.appearance().clearButtonMode = .whileEditing
              }
      }
  }
}
