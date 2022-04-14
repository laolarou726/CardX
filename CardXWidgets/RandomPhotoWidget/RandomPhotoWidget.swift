//
//  RandomPhotoWidget.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/14.
//

import WidgetKit
import SwiftUI
import Intents

struct RandomPhotoWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: RandomPhotoTimelineProvider.Entry
    
    var body: some View {
        VStack{
            Spacer()
            if(self.widgetFamily != .systemSmall){
                HStack(alignment: .bottom){
                    Rectangle()
                        .fill(Color(hex: self.entry.color))
                        .frame(width: 40, height: 8)
                        .padding([.leading, .bottom])
                        .shadow(radius: 10)
                    Spacer()
                    VStack(alignment: .trailing){
                        Spacer()
                        Text(self.entry.exifName)
                            .font(Font.custom("IBM 3270", size: 10))
                            .foregroundColor(.orange)
                            .shadow(color: .red, radius: 2)
                            .padding([.trailing, .bottom])
                    }
                }
                .background(
                    Image(uiImage: self.entry.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .blur(radius: 20))
                .clipped()
                .frame(height: 40)
            }
        }
        .background(
            Image(uiImage: self.entry.image)
            .resizable()
            .scaledToFill())
    }
}

struct RandomPhotoWidget: Widget {
    let kind: String = "RandomPhotoWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: RandomPhotoTimelineProvider()) { entry in
            RandomPhotoWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .systemExtraLarge])
        .configurationDisplayName("Random Photo")
        .description("Display a random quote  from the web.")
    }
}

struct RandomPhotoWidget_Previews: PreviewProvider {
    static var previews: some View {
        RandomPhotoWidgetEntryView(entry: RandomPhotoEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
