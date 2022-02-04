//
//  CountDownTexts.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/2/3.
//

import SwiftUI

struct CountDownTexts: View {
    let number: Int
    let unit: String
    
    var body: some View {
        HStack{
            getTextCards(number: number, unit: unit)
        }
    }
    
    @ViewBuilder
    func getTextCards(number: Int, unit: String) -> some View{
        if(number > 99){
            CountDownText(content: "9")
                .frame(width: 30)
            CountDownText(content: "9")
                .frame(width: 30)
            CountDownText(content: "+")
                .frame(width: 30)
        }
        else if (number >= 10){
            CountDownText(content: String(number / 10))
                .frame(width: 30)
            CountDownText(content: String(number % 10))
                .frame(width: 30)
        }
        else{
            CountDownText(content: String(number))
                .frame(width: 30)
        }
        
        Text(unit)
            .padding(3)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(.white)
                    .shadow(radius: 10))
    }
}

struct CountDownTexts_Previews: PreviewProvider {
    static var previews: some View {
        CountDownTexts(number: 200, unit: "Days")
    }
}
