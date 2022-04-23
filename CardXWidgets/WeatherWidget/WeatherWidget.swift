//
//  WeatherWidget.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import SwiftUI
import WidgetKit

struct WeatherWidgetEntryView: View {
    var entry: WeatherTimelineProvider.Entry
    
    var body: some View {
        ZStack{
            HStack{
                Spacer()
                getWeatherShape(weatherType: self.entry.weatherType)
            }
            HStack{
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 5)
                    Text(self.entry.location)
                        .font(.title2)
                        .foregroundColor(.accentColor)
                        .padding([.vertical], 2)
                    HStack{
                        Image(uiImage: self.entry.weatherImg)
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text(self.entry.weatherDescription)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    HStack{
                        Text("\(self.entry.feelLikeTemp, specifier: "%.1f") °C")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("(\(self.entry.minTemp, specifier: "%.1f") / \(self.entry.maxTemp, specifier: "%.1f"))")
                            .font(.caption2)
                    }
                    HStack{
                        Text("\(self.entry.humidity, specifier: "%.1f") %")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(3)
                        Text("|")
                            .foregroundColor(.secondary)
                        Text("\(self.entry.windSpeed, specifier: "%.1f") m/s")
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

struct WeatherWidget: Widget {
    let kind: String = "WeatherWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: WeatherSettingsIntent.self, provider: WeatherTimelineProvider()) { entry in
            WeatherWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium, .systemLarge])
        .configurationDisplayName("Current Weather")
        .description("Display today's weather.")
    }
}

struct WeatherWidget_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWidgetEntryView(entry: WeatherEntry(date: Date(), configuration: WeatherSettingsIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
