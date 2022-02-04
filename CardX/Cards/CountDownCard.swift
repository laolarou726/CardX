//
//  CountDownCard.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/2/3.
//

import SwiftUI

struct CountDownCard: View {
    var body: some View {
        ZStack{
            Image("Image")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack{
                HStack{
                    Text("Meet with Paul")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .shadow(radius: 5)
                    Spacer()
                }
                HStack{
                    CountDownTexts(number: 200, unit: "Days")
                    Spacer()
                }
            }
            .frame(height: 60, alignment: .center)
            .padding([.horizontal])
        }
        .cornerRadius(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(radius: 10))
        .padding([.top, .horizontal])
    }
}

struct CountDownCard_Previews: PreviewProvider {
    static var previews: some View {
        CountDownCard()
    }
}
