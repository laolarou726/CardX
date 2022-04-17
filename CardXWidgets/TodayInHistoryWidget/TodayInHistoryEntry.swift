//
//  TodayInHistoryEntry.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import Foundation
import WidgetKit

struct TodayInHistoryEntry : TimelineEntry{
    var date: Date
    var configuration: ConfigurationIntent
    
    var type: String! = "Event"
    var year: String! = "1969"
    var history: String! = "Ken Thompson, a programmer at Bell Labs in the United States, developed a version of UNIX on an old PDP-7 machine using the B compiled language."
}
