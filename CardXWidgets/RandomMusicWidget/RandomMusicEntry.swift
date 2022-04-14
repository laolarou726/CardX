//
//  RandomMusicEntry.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/14.
//

import Foundation
import WidgetKit
import UIKit

struct RandomMusicEntry : TimelineEntry{
    var date: Date
    var configuration: ConfigurationIntent
    
    var imgData: UIImage! = UIImage(imageLiteralResourceName: "Default_Cover")
    var name: String! = "-"
    var mark: String! = "Mark -"
    var pop: String! = "Popularity -"
}
