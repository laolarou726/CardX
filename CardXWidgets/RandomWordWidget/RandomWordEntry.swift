//
//  RandomWordEntry.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/3/31.
//

import Foundation
import WidgetKit

struct RandomWordEntry : TimelineEntry{
    var date: Date
    var word: RandomWordModel
    var configuration: ConfigurationIntent
}
