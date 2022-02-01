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
            HStack{
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 20)
                    Text(Locale.current.localizedString(forRegionCode: Locale.current.regionCode!) ?? "")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(Date.now, format: .dateTime.hour().minute())
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text(Date.now, format: .dateTime.day().month().year())
                        .foregroundColor(.secondary)
                    Spacer()
                        .frame(height: 20)
                }
                .layoutPriority(100)
                Spacer()
            }
            .padding()
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
}

struct TimeCard_Previews: PreviewProvider {
    static var previews: some View {
        TimeCard()
    }
}
