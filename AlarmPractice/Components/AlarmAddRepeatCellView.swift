//
//  AlarmAddRepeatCellView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/15.
//

import SwiftUI

struct AlarmAddRepeatCellView : View {
    @Binding var repeatDay: [RepeatDay]
    
    var body: some View {
        NavigationLink(destination: AlarmRepeatView(repeatDay: $repeatDay)){
            HStack {
                Text("반복")
                
                Spacer()
                
                if $repeatDay.count == 0 {
                    Text("안 함")
                        .foregroundColor(.gray)
                } else {
                    Text(repeatDay.repeats)
                }
            }
        }
    }
}

//struct AlarmAddRepeatCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlarmAddRepeatCellView(repeatDay: [])
//    }
//}
