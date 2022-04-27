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
    var configuration: TodayInHistorySettingsIntent
    
    var type: String! = "UNKNOWN"
    var year: String! = "-"
    var history: String! = "-"
    var jsonStr: String! = "-"
}
