//
//  DaysCountDownControl.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/2/3.
//

import SwiftUI

struct CountDownText: View {
    let content: String
    
    var body: some View {
        ZStack{
            VStack{
                ZStack{
                    Rectangle()
                        .fill(.ultraThinMaterial)
                    Rectangle()
                        .fill(.gray)
                        .opacity(0.25)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: -3, trailing: 0))
                ZStack{
                    Rectangle()
                        .fill(.ultraThinMaterial)
                    Rectangle()
                        .fill(.gray)
                        .opacity(0.15)
                }
                .padding(EdgeInsets(top: -3, leading: 0, bottom: 0, trailing: 0))
            }
            .edgesIgnoringSafeArea(.all)
            Text(content)
                .font(.system(size: 3000))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .shadow(radius: 10)
                .minimumScaleFactor(0.01)
        }
    }
}

struct CountDownText_Previews: PreviewProvider {
    static var previews: some View {
        CountDownText(content: "1")
    }
}
