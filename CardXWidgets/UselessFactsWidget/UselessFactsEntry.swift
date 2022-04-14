//
//  UselessFactsEntry.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import Foundation
import WidgetKit

struct UselessFactsEntry : TimelineEntry{
    var date: Date
    var configuration: ConfigurationIntent
    
    var facts: String! = "-"
}
