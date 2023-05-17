//
//  MyNavigationView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/08.
//

import SwiftUI

struct MyNavigationView: View {
    @ObservedObject var alarmData: AlarmData
    
    @State private var showModal = false
    
//    init() {
//            let coloredAppearance = UINavigationBarAppearance()
//
//                // for automatic and large displayMode
////        coloredAppearance.largeTitleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.darkText]
//                // to make everything work normally
//                UINavigationBar.appearance().standardAppearance = coloredAppearance
//
//        }
    
    var body: some View {
        NavigationView{
            ZStack {
//                Color.black
//                    .edgesIgnoringSafeArea(.all)
                
                List{
                    Section(header: listHeaderView() ){
                        listTextView()
                    }
                    .foregroundColor(Color.primary)
                    .font(.body)
                    
                    Section(header: Text("기타") ){
                        ForEach(alarmData.alarms) { alarm in
                            AlarmView(alarmData: self.alarmData, alarm: alarm)
                        }
                        .onDelete(perform: alarmData.removeAlarm)
                        .swipeActions {
                            Button("Delete", role: .destructive, action: { })
                        }
                        
                    }
                    .foregroundColor(Color.white)
                    .font(.body)
//                    .swipeActions {
//                        Button("Delete", role: .destructive, action: {  })
//                    }
                    .tint(Color.red)
                }//list
//                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                // iOS16부터 아래 명령어를 써야지 백 컬러 설정가능
                .navigationBarTitle("알람" ,displayMode: .automatic)
                .navigationBarItems(leading: EditButton()
                    .foregroundColor(Color.orange))
                .navigationBarItems(trailing: Button(action: {
                    self.showModal = true
                }){
                    Text("+")
                }
                    .font(.largeTitle)
                    .foregroundColor(Color.orange)
                    .sheet(isPresented: self.$showModal) {
                        ModalView(alarmData: self.alarmData)
                                }
                )
            }
        }//NavigationView
    }
//    func removeAlarm(at offsets: IndexSet) {
//        alarmData.alarms.remove(atOffsets: offsets)
//    }
}

struct listHeaderView: View {
    var body: some View {
        HStack{
            Image(systemName: "bed.double.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
            Text("수면 | 기상")
                .font(.body)
                .fontWeight(.bold)
        }
    }
}

struct listTextView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("알람 없음")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                Text("내일 아침")
                    .frame(alignment: .leadingFirstTextBaseline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button {
                    print("버튼 클릭!")
                } label: {
                    Text("변경")
                        .foregroundColor(.orange)
                }
                .padding(4)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray))
        }
    }
}

//struct MyNavigationView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyNavigationView()
//    }
//}
