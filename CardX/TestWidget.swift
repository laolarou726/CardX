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
            Image("Image-1")
                .resizable()
                .blur(radius: 10)
            Rectangle()
                .background(.secondary)
                .opacity(0.2)
            VStack(alignment: .leading){
                Spacer()
                HStack{
                    Text("Today")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal, 5)
                        .background(.pink)
                    Text("In")
                        .bold()
                    Text("History")
                        .bold()
                }
                .padding(.leading)
                VStack(alignment: .leading){
                    Text("43 BC")
                        .font(.footnote)
                        .padding(.leading)
                        .padding(.top, 3)
                        .foregroundColor(.secondary)
                    Text("Battle of Forum Gallorum between the forces of Mark Antony, and legions loyal to the Roman Senate under the overall command of consul Gaius Pansa.")
                        .font(.subheadline)
                        .fontWeight(.heavy)
                        .blendMode(.overlay)
                        .padding(.horizontal)
                }
                Spacer()
            }
        }
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
