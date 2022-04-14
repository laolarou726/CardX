//
//  RandomMusicWidget.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/14.
//

import WidgetKit
import SwiftUI
import Intents

struct RandomMusicWidgetEntryView : View {
    var entry: RandomMusicTimelineProvider.Entry
    
    var body: some View {
        HStack{
            Image(uiImage: self.entry.imgData)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding()
            VStack(alignment: .leading){
                Spacer()
                Text(self.entry.name)
                    .bold()
                    .padding(.trailing)
                    .blendMode(.overlay)
                HStack{
                    Spacer()
                    ZStack{
                        Text(self.entry.mark)
                            .foregroundColor(.white)
                            .font(.system(size: 10))
                            .padding([.leading, .trailing], 4)
                            .padding([.top, .bottom], 1)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                        .fill(.blue))
                    ZStack{
                        Text(self.entry.pop)
                            .foregroundColor(.white)
                            .font(.system(size: 10))
                            .padding([.leading, .trailing], 4)
                            .padding([.top, .bottom], 1)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                        .fill(.pink))
                    .padding([.trailing])
                }
                Spacer()
            }
            Spacer()
        }
        .background(
            Image(uiImage: self.entry.imgData)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .padding(-80)
            .blur(radius: 20))
    }
}

struct RandomMusicWidget: Widget {
    let kind: String = "RandomMusicWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: RandomMusicTimelineProvider()) { entry in
            RandomMusicWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium, .systemLarge])
        .configurationDisplayName("Random Music")
        .description("Display a random quote  from the web.")
    }
}

struct RandomMusicWidget_Previews: PreviewProvider {
    static var previews: some View {
        RandomMusicWidgetEntryView(entry: RandomMusicEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
