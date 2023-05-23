//
//  ChangeWakeUp.swift
//  AlarmPractice
//
//  Created by BAE on 2023/05/23.
//

import SwiftUI

struct ChangeWakeUp: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Change Wake Up Time")
                    .navigationTitle("기상 시간 변경")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Button("저장") {
                                print("저장")
                            }
                            .foregroundColor(.orange)
                        }
                        ToolbarItem(placement: .cancellationAction) {
                            Button("취소", role: .cancel) {
                                self.dismiss()
                            }
                            .foregroundColor(.orange)
                        }
                    }//toolbar
            }
        }
    }
}

struct ChangeWakeUp_Previews: PreviewProvider {
    static var previews: some View {
        ChangeWakeUp()
//            .tint(.orange)
    }
}
