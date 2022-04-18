//
//  TodayInHistoryWidget.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import WidgetKit
import SwiftUI
import Intents

struct TodayInHistoryWidgetEntryView : View {
    var entry: TodayInHistoryTimelineProvider.Entry
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            HStack{
                Text("Today")
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.horizontal, 5)
                    .background(.pink)
                Text("In")
                    .bold()
                Text("History")
                    .bold()
            }
            .padding(.leading)
            VStack(alignment: .leading){
                Text("\(self.entry.year) | \(self.entry.type)")
                    .font(.footnote)
                    .bold()
                    .padding(.leading)
                    .padding(.top, 3)
                    .blendMode(.overlay)
                Text(self.entry.history)
                    .font(.subheadline)
                    .fontWeight(.heavy)
                    .blendMode(.overlay)
                    .padding(.horizontal)
            }
            Spacer()
        }
        .background(
            ZStack{
                Image("Image-1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(-40)
                    .blur(radius: 10)
                Rectangle()
                    .fill(.black)
                    .opacity(0.3)
                    .padding(-40)
            })
    }
}

struct TodayInHistoryWidget: Widget {
    let kind: String = "TodayInHistoryWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: TodayInHistoryTimelineProvider()) { entry in
            TodayInHistoryWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium, .systemLarge, .systemExtraLarge])
        .configurationDisplayName("Today In History")
        .description("Today in history!")
    }
}

struct TodayInHistoryWidget_Previews: PreviewProvider {
    static var previews: some View {
        TodayInHistoryWidgetEntryView(entry: TodayInHistoryEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
