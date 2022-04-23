//
//  RandomDogPhotoWidget.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/22.
//

import WidgetKit
import SwiftUI
import Intents

struct RandomAnimalWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: RandomAnimalTimelineProvider.Entry
    
    var body: some View {
        ZStack{
            Image(uiImage: self.entry.image)
            .resizable()
            .scaledToFill()
        }
    }
}

struct RandomDogWidget: Widget {
    let kind: String = "RandomAnimalWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: RandomAnimalSettingsIntent.self, provider: RandomAnimalTimelineProvider()) { entry in
            RandomAnimalWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .systemExtraLarge])
        .configurationDisplayName("Animal Photos")
        .description("Display a random animal photo from the web.")
    }
}

struct RandomDogWidget_Previews: PreviewProvider {
    static var previews: some View {
        RandomAnimalWidgetEntryView(entry: RandomAnimalEntry(date: Date(), configuration: RandomAnimalSettingsIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
