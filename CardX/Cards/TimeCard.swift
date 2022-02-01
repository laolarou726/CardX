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
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 125, height: 125, alignment: .center)
                ForEach(Range(0...11)){i in
                    Circle()
                        .frame(maxWidth: 5)
                        .foregroundColor(.black)
                        .offset(y: -61)
                        .rotationEffect(.degrees(Double(i*30)))
                }
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 60,height: 2)
                    .offset(x:29)
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 2,height: 40)
                    .offset(y:-20)
            }
            .offset(x:75)
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
