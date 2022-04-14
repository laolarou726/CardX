//
//  RandomQuoteWidget.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/3/31.
//

import WidgetKit
import SwiftUI
import Intents

struct RandomQuoteWidgetEntryView : View {
    var entry: RandomQuoteTimelineProvider.Entry
    
    var body: some View {
        ZStack{
            Image(uiImage: self.entry.imgData)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 20)
            HStack{
                Spacer()
                VStack(alignment: .leading) {
                    Spacer()
                    Text((self.entry.quote.contents?.quotes?[0].author) ?? "unknown")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text((self.entry.quote.contents?.quotes?[0].date) ?? "1970-00-00")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Text((self.entry.quote.contents?.quotes?[0].quote) ?? "hmm...I can't find any quote.")
                        .font(.body)
                        .fontWeight(.black)
                        .lineLimit(4)
                    Spacer()
                }
                .layoutPriority(100)
                Spacer()
            }
        }
    }
}

struct RandomQuoteWidget: Widget {
    let kind: String = "RandomQuoteWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: RandomQuoteTimelineProvider()) { entry in
            RandomQuoteWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium, .systemLarge])
        .configurationDisplayName("Random Quote")
        .description("Display a random quote  from the web.")
    }
}

struct RandomQuoteWidget_Previews: PreviewProvider {
    static var previews: some View {
        RandomQuoteWidgetEntryView(entry: RandomQuoteEntry(date: Date(), quote: RandomQuoteModel(), imgData: UIImage(imageLiteralResourceName: "image"), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
