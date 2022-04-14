//
//  UselessFactsWidget.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import WidgetKit
import SwiftUI
import Intents

struct UselessFactsWidgetEntryView : View {
    var entry: UselessFactsTimelineProvider.Entry
    
    var body: some View {
        HStack{
            Spacer()
            VStack(alignment: .leading){
                Spacer()
                Text("Do you know that")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text(self.entry.facts)
                    .bold()
                Spacer()
            }
            Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("WordCardGradient_2_1"), Color("WordCardGradient_2_2")]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct UselessFactsWidget: Widget {
    let kind: String = "UselessFactsWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: UselessFactsTimelineProvider()) { entry in
            UselessFactsWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium, .systemLarge, .systemExtraLarge])
        .configurationDisplayName("Useless Facts")
        .description("Display a random word from the web.")
    }
}

struct UselessFactsWidget_Previews: PreviewProvider {
    static var previews: some View {
        UselessFactsWidgetEntryView(entry: UselessFactsEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
