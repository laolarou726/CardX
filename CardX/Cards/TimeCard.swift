//
//  TimeCard.swift
//  CardX
//
//  Created by Tina Wang on 1/30/22.
//

import SwiftUI

struct TimeCard: View {
    var body: some View {
        ZStack{
            HStack{
                Spacer()
            }
            todayText()
            ZStack{
                Circle()
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 75, height: 75, alignment: .center)
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 30,height: 3)
                    .offset(x:14)
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 3,height: 25)
                    .offset(y:-12)
            }
            .offset(x:120)
        }
        .cornerRadius(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(radius: 10))
        .padding([.top, .horizontal])
    }
    
    func todayText() -> some View{
        let now = Date()
        let locale = Locale.current
        let formatter = DateFormatter()

        formatter.dateFormat = "EEEE, MMM d"
        
        let date = formatter.string(from: Date.now).uppercased()
        
        formatter.locale = locale
        formatter.dateFormat = "h:mm a"
        
        let time = formatter.string(from: now)
        let location = locale.localizedString(forRegionCode: locale.regionCode!)!

        return BriefTextControl(upperText: location, title: time, bottomText: date)
    }
}

struct TimeCard_Previews: PreviewProvider {
    static var previews: some View {
        TimeCard()
    }
}
