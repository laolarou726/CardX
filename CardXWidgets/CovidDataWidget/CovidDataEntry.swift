//
//  CovidDataEntry.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/14.
//

import SwiftUI
import Foundation
import WidgetKit

struct CovidDataEntry : TimelineEntry{
    var date: Date
    var configuration: ConfigurationIntent
    
    var values: [(Double, Color, String)]! = [
        (1, .primary, "Unknown")
    ]
}
