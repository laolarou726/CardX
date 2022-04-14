//
//  TestWidget.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import SwiftUI

struct TestWidget: View {
    var body: some View {
        ZStack{
            Image("Image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(-40)
                .blur(radius: 20)
            VStack{
                Spacer()
                HStack(alignment: .bottom){
                    Rectangle()
                        .fill(Color(hex: "#fff"))
                        .frame(width: 40, height: 8)
                        .padding([.leading, .bottom])
                        .shadow(radius: 10)
                    Spacer()
                    VStack(alignment: .trailing){
                        Spacer()
                        Text("SONY, ILCE-7M2")
                            .font(Font.custom("IBM 3270", size: 10))
                            .foregroundColor(.orange)
                            .shadow(color: .red, radius: 2)
                            .padding([.trailing, .bottom])
                    }
                }
                .frame(height: 30)
            }
        }
        .clipped()
        .cornerRadius(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(radius: 10))
        .frame(width: 360, height: 169)
    }
}

struct TestWidget_Previews: PreviewProvider {
    static var previews: some View {
        TestWidget()
    }
}
