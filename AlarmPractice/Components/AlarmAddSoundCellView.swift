//
//  AlarmAddSoundCellView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/15.
//

import SwiftUI

struct AlarmAddSoundCellView: View {
    var body: some View {
        NavigationLink(destination: AlarmSoundView()){
            HStack {
                Text("사운드")
                Spacer()
                Text("전파 탐지기")
                    .foregroundColor(.gray)
            }
        }
    }
}

