//
//  RandomPokemonWidget.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/29.
//

import WidgetKit
import SwiftUI
import Intents

struct RandomPokemonWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: RandomPokemonTimelineProvider.Entry
    
    var body: some View {
        Link(destination: URL(string: "widget-deeplink://pokemon/\(entry.jsonStr ?? "-")")!){
            ZStack{
                Rectangle()
                    .fill(entry.backgroundColor)
                
                VStack{
                    if(self.widgetFamily == .systemSmall || self.widgetFamily == .systemMedium){
                        Spacer()
                    }
                    
                    HStack{
                        VStack(alignment: .leading){
                            if(self.widgetFamily == .systemSmall || self.widgetFamily == .systemMedium){
                                Spacer()
                            }
                            
                            HStack{
                                Text(entry.height)
                                    .font(.footnote)
                                    .foregroundColor(.black.opacity(0.6))
                                Text(entry.weight)
                                    .font(.footnote)
                                    .foregroundColor(.black.opacity(0.6))
                            }
                            
                            Text(entry.name)
                                .font(.title)
                                .foregroundColor(.black)
                                .bold()
                            
                            LazyHStack{
                                ForEach(0..<entry.types.count, id: \.self){
                                    index in
                                    
                                    Text(entry.types[index])
                                        .padding(.horizontal, 3)
                                        .padding(.vertical, 0)
                                        .foregroundColor(Color(UIColor.systemBackground))
                                        .background(.primary)
                                        .cornerRadius(5)
                                }
                            }
                            .frame(height: 20)
                            .frame(maxWidth: 150, alignment: .leading)
                            .clipped()
                            .mask(
                                LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(0)]), startPoint: .center, endPoint: .trailing)
                            )
                            
                            Spacer()
                        }
                        .padding()
                        
                        if(self.widgetFamily != .systemSmall){
                            Spacer()
                            
                            VStack{
                                if(self.widgetFamily == .systemSmall || self.widgetFamily == .systemMedium){
                                    Spacer()
                                }
                                
                                Image(uiImage: entry.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .padding()
                                Spacer()
                            }
                        }
                    }
                    
                    if(self.widgetFamily == .systemLarge || self.widgetFamily == .systemExtraLarge){
                        LazyVStack(alignment: .leading){
                            ForEach(0..<min(4, entry.stats.count), id: \.self){
                                index in
                                
                                let stat = entry.stats[index]
                                
                                VStack(alignment: .leading){
                                    Text("\(stat.key ?? "-") (\(stat.value ?? 0)/100)")
                                        .font(.footnote)
                                    MultiProgressBar([
                                        (Double(stat.value ?? 0), .black, ""),
                                        (Double(100 - (stat.value ?? 0)), .gray, "")], false)
                                    .frame(height: 10)
                                }
                                .padding(.horizontal)
                            }
                        }
                        .frame(height: 200)
                        .clipped()
                    }
                }
            }
        }
        .widgetURL(URL(string: "widget-deeplink://pokemon/\(entry.jsonStr ?? "-")")!)
    }
}

struct RandomPokemonWidget: Widget {
    let kind: String = "RandomPokemonWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: PokemonSettingsIntent.self, provider: RandomPokemonTimelineProvider()) { entry in
            RandomPokemonWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .systemExtraLarge])
        .configurationDisplayName("Random Pokemon")
        .description("Display a random Pokemon from the Unsplash.")
    }
}

struct RandomPokemonWidget_Previews: PreviewProvider {
    static var previews: some View {
        RandomPokemonWidgetEntryView(entry: RandomPokemonEntry(date: Date(), configuration: PokemonSettingsIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
