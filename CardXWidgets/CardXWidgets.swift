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
   }
}
