//
//  WeatherCard.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/1/27.
//

import SwiftUI

struct WeatherCard: View {
    let weatherType : WeatherTypes
    
    var body: some View {
        ZStack{
            HStack{
                Spacer()
                getWeatherShape()
            }
            HStack{
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 20)
                    Text("MC")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text("TEST")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text("TEST")
                        .foregroundColor(.secondary)
                    Spacer()
                        .frame(height: 20)
                }
                .layoutPriority(100)
                Spacer()
            }
            .padding()
        }
        .cornerRadius(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(radius: 10))
        .padding([.top, .horizontal])
    }
    
    @ViewBuilder
    func getWeatherShape() -> some View{
        switch(weatherType){
        case .Sunny:
            SunnyShape()
                .padding(.bottom, -120)
        case .Cloudy:
            CloudyShape()
                .padding(.bottom, 0)
        case .Rainy:
            RainyShape()
                .padding(.bottom, 0)
        }
    }
}

struct WeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCard(weatherType: .Rainy)
    }
}
