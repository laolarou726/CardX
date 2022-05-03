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
                    .lineLimit(3)
                HStack{
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
                Text(self.entry.author)
                    .font(.subheadline)
                    .padding(.trailing)
                    .blendMode(.overlay)
                Spacer()
            }
            Spacer()
        }
        .background(
            ZStack{
                Image(uiImage: self.entry.imgData)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(-80)
                .blur(radius: 20)
                Rectangle()
                    .fill(Color(UIColor.systemBackground)
                        .opacity(0.2))
            })
    }
}

struct RandomMusicWidget: Widget {
    let kind: String = "RandomMusicWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: RandomMusicSettingsIntent.self, provider: RandomMusicTimelineProvider()) { entry in
            RandomMusicWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium, .systemLarge, .systemExtraLarge])
        .configurationDisplayName("Billboard Music")
        .description("Randomly pick a music from Billboard recommandation list.")
    }
}

struct RandomMusicWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RandomMusicWidgetEntryView(entry: RandomMusicEntry(date: Date(), configuration: RandomMusicSettingsIntent()))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            RandomMusicWidgetEntryView(entry: RandomMusicEntry(date: Date(), configuration: RandomMusicSettingsIntent()))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
