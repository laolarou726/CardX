//
//  CardXWidgets.swift
//  CardXWidgets
//
//  Created by 罗麟瑞 on 2022/3/30.
//

import WidgetKit
import SwiftUI

@main
struct CardXWidgets: WidgetBundle {
   var body: some Widget {
       RandomWordWidget()
       RandomQuoteWidget()
       WeatherWidget()
       MovieRecommendWidget()
       CardXWidgets2().body
   }
}

struct CardXWidgets2: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        UselessFactsWidget()
        TodayInHistoryWidget()
        RandomMusicWidget()
        RandomPhotoWidget()
        CardXWidgets3().body
    }
}

struct CardXWidgets3: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        RandomMusicWidget()
        RandomDogWidget()
    }
}
