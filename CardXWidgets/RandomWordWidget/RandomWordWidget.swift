//
//  RandomWordWidget.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/3/30.
//

import WidgetKit
import SwiftUI
import Intents

struct RandomWordWidgetEntryView : View {
    var entry: RandomWordTimelineProvider.Entry
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                BriefTextControl(
                    upperText: self.entry.word.pronunciation!,
                    title: self.entry.word.word!,
                    bottomText: self.entry.word.definition!)
                Spacer()
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("WordCardGradient_1_1"), Color("WordCardGradient_1_2")]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct RandomWordWidget: Widget {
    let kind: String = "RandomWordWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: RandomWordTimelineProvider()) { entry in
            RandomWordWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium])
        .configurationDisplayName("Random word")
        .description("Display a random word from the web.")
    }
}

struct RandomWordWidget_Previews: PreviewProvider {
    static var previews: some View {
        RandomWordWidgetEntryView(entry: RandomWordEntry(date: Date(), word: RandomWordModel(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
