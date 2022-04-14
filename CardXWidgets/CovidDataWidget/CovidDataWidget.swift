//
//  CovidDataWidget.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/14.
//

import WidgetKit
import SwiftUI
import Intents

struct CovidDataWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: CovidDataTimelineProvider.Entry
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            HStack{
                Image("Covid_Icon")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Global COVID Status")
                    .font(.title2)
            }
            .padding()
            
            if(self.widgetFamily == .systemLarge || self.widgetFamily == .systemExtraLarge){
                LazyVStack(alignment: .leading){
                    ForEach(0..<self.entry.values.count, id: \.self){
                        index in
                        
                        let data = self.entry.values[index]
                        
                        Label("Total \(data.2): \(Int(data.0))", systemImage: "person.crop.circle")
                    }
                }
                .padding()
            }
            
            MultiProgressBar(self.entry.values)
                .padding([.horizontal, .bottom])
            Spacer()
        }
    }
}

struct CovidDataWidget: Widget {
    let kind: String = "CovidDataWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: CovidDataTimelineProvider()) { entry in
            CovidDataWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium, .systemLarge, .systemExtraLarge])
        .configurationDisplayName("Covid Data")
        .description("Display a random word from the web.")
    }
}

struct CovidDataWidget_Previews: PreviewProvider {
    static var previews: some View {
        CovidDataWidgetEntryView(entry: CovidDataEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
