//
//  WeatherCard.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/1/27.
//

import SwiftUI

struct WeatherCard: View {
    @ObservedObject var vm = WeatherCardViewModel()
    
    var body: some View {
        ZStack{
            HStack{
                Spacer()
                getWeatherShape(weatherType: self.vm.weatherType)
            }
            HStack{
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 5)
                    Text(self.vm.location)
                        .font(.title2)
                        .foregroundColor(.accentColor)
                        .padding([.vertical], 2)
                    HStack{
                        AsyncImage(
                            url: URL(string: self.vm.weatherIconUrl),
                            content: {image in
                                image
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            },
                            placeholder: {
                                Text("-")
                                    .foregroundColor(.secondary)
                            })
                        Text(self.vm.weatherDescription)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    HStack{
                        Text("\(self.vm.feelLikeTemp, specifier: "%.1f") °C")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("(\(self.vm.minTemp, specifier: "%.1f") / \(self.vm.maxTemp, specifier: "%.1f"))")
                            .font(.caption2)
                    }
                    HStack{
                        Text("\(self.vm.humidity, specifier: "%.1f") %")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(3)
                        Text("|")
                            .foregroundColor(.secondary)
                        Text("\(self.vm.windSpeed, specifier: "%.1f") m/s")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(3)
                    }
                    Spacer()
                        .frame(height: 5)
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
        .onAppear{
            self.vm.refreshData()
        }
    }
    
    @ViewBuilder
    func getWeatherShape(weatherType: WeatherTypes) -> some View{
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
        WeatherCard()
    }
}
