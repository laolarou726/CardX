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
            VStack(alignment: .leading){
                Spacer()
                HStack{
                    Image("Covid_Icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("Global COVID Status")
                        .font(.title)
                }
                .padding(.leading)
                VStack(alignment: .leading){
                    Text("Total Death: 213")
                    Text("Total Comfirm: 23")
                    Text("Remaining Health: 1123")
                }
                .padding()
                MultiProgressBar([
                    (213, Color(hex: "#ef5350"), "Comfirm"),
                    (23, .secondary, "Death"),
                    (1123, Color(hex: "#536dfe"), "Health")
                ])
                .padding([.horizontal, .bottom])
                Spacer()
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
