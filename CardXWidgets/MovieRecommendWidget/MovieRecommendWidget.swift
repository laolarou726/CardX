//
//  MovieRecommendWidget.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import SwiftUI
import WidgetKit
import Intents

struct MovieRecommendWidgetEntryView : View {
    var entry: MovieRecommendTimelineProvider.Entry
    
    var body: some View {
        ZStack{
            HStack{
                Spacer()
                Image(uiImage: self.entry.movieImg)
                    .resizable()
                    .shadow(radius: 10)
                    .cornerRadius(8)
                    .frame(width: 84.25, height: 125)
                VStack(alignment: .leading){
                    Spacer()
                    HStack{
                        Text(self.entry.typeAndCountry)
                            .font(.footnote)
                        Spacer()
                        Text(self.entry.year)
                            .font(.footnote)
                            .padding([.trailing])
                    }
                    Text(self.entry.title)
                        .bold()
                        .lineLimit(2)
                    Text(self.entry.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                    HStack{
                        Text(self.entry.time)
                            .font(.system(size: 10))
                        Spacer()
                        ZStack{
                            Text(self.entry.imdbRating)
                                .foregroundColor(.white)
                                .font(.system(size: 10))
                                .padding([.leading, .trailing], 4)
                                .padding([.top, .bottom], 1)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                            .fill(.blue))
                        ZStack{
                            Text(self.entry.rottenRating)
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
                .padding([.horizontal], 4)
                Spacer()
            }
        }
    }
}

struct MovieRecommendWidget: Widget {
    let kind: String = "MovieRecommendWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: MovieRecommendTimelineProvider()) { entry in
            MovieRecommendWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Movie Recommend")
        .description("Display a random movie from IMDB recommandation database.")
    }
}

struct MovieRecommendWidget_Previews: PreviewProvider {
    static var previews: some View {
        MovieRecommendWidgetEntryView(entry: MovieRecommendEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
