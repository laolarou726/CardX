//
//  RandomQuoteEntry.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/3/31.
//

import Foundation
import WidgetKit
import UIKit

struct RandomQuoteEntry : TimelineEntry{
    var date: Date
    var quote: RandomQuoteModel
    var imgData: UIImage
    var jsonStr: String! = "-"
    var configuration: ConfigurationIntent
}
