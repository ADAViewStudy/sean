//
//  MyNavigationView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/08.
//
// test
import SwiftUI

struct MyNavigationView: View {
    
    @ObservedObject var alarmData: AlarmData
    @State private var showModal = false
    
    var body: some View {
        NavigationView{
            ZStack {
                List{
                    Section(header: listHeaderView()) {
                        Text("\n기타")
                        ForEach(alarmData.alarms) { alarm in
                            AlarmView(alarmData: self.alarmData, alarm: alarm)
                        }//: ForEach
                        .onDelete(perform: self.alarmData.removeAlarm)
                    }//: Section
                    .foregroundColor(Color.primary)
                    .font(.body)
                    .tint(Color.red)
                }//: list
                .listStyle(.plain)
                // iOS16부터 아래 명령어를 써야지 백 컬러 설정가능
                .scrollContentBackground(.hidden)
                .navigationBarTitle("알람" ,displayMode: .automatic)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            self.showModal = true
                        }){
                            Text("+")
//                                .font(.largeTitle)
                                .font(.system(size: 34, weight: .light))
                        }
                        .sheet(isPresented: self.$showModal) {
                            ModalView(alarmData: self.alarmData)
                                .tint(.orange)
                        }//: sheet
                    }//: ToolbarItem
                }//: toolbar
            }//: ZStack
        }//: NavigationView
    }//: body
    
    func printLog(){
        print(self.alarmData.alarms[0])
    }
}//: MyNavigationView

struct listHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            HStack(spacing: 2){
                Image(systemName: "bed.double.fill")
                Text("수면 | 기상")
                    .font(.body)
                    .fontWeight(.bold)
            }
            Divider()
            listTextView()
        }//: VStack
    }//: body
}//: listHeaderView

struct listTextView: View {
    
    @State private var showModal = false
    
    var body: some View {
        HStack(alignment: .center){
            
            VStack(alignment: .leading){
                Text("알람 없음")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                Text("내일 아침")
                    .frame(alignment: .leadingFirstTextBaseline)
                    .foregroundColor(.gray)
                Spacer()
            }//: VStack
            
            Spacer()
            
            Button {
                self.showModal = true
            } label: {
                Text("변경")
                    .foregroundColor(.orange)
                    .font(.caption2)
                    .bold()
                    .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
            }//: Button
            .background(RoundedRectangle(cornerRadius: 15).fill(Color(UIColor.systemGray5)))
            .sheet(isPresented: self.$showModal) {
                ChangeWakeUp()
            }//: sheet
        }//: HStack
    }//: body
}//: listTextView

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView(alarmData: AlarmData(alarms: []))
            .tint(.orange)
    }
}
