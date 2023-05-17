//
//  MyView.swift
//  AlarmPractice
//
//  Created by Greed on 2023/05/09.
//

import SwiftUI

struct MyView: View {
    var title : String
//    var bgColor : Color
    var body: some View {
        ZStack{
            
//            bgColor.edgesIgnoringSafeArea(.all)
            Text(title)
                .font(.largeTitle)
                .fontWeight(.black)
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(title: "마이뷰")
    }
}
