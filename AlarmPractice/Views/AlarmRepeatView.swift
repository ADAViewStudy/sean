//
//  AlarmRepeatView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/15.
//

import SwiftUI

struct AlarmRepeatView: View {
    @Binding var repeatDay: [RepeatDay]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            ForEach(0..<7) { index in
                AlarmRepeatCellView(repeatDay: self.$repeatDay, index: .constant(index), isContained: self.isContained(index))
            }
        }
        .listStyle(.grouped)
        .navigationBarTitle(Text("반복"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                HStack{
                    Image(systemName: "chevron.backward")
                        .bold()
                    Text("뒤로")
                        .font(.headline)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    self.dismiss()
                }
                .foregroundColor(.orange)
//
//                Button {
//                    print("뒤로")
//                    self.dismiss()
//                } label: {
//                    Label("뒤로", systemImage: "chevron.backward")
////                        .font(.body)
//                }
//                .tint(.orange)
            }
        }
    }
    
    private func isContained(_ index: Int) -> Bool {
        let day = RepeatDay(rawValue: index)!
        
        return self.repeatDay.contains(day)
    }
}

