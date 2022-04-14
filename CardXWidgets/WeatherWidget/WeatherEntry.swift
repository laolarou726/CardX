//
//  WeatherEntry.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import Foundation
import WidgetKit
import UIKit

struct WeatherEntry : TimelineEntry{
    var date: Date
    var configuration: ConfigurationIntent
    
    var weatherImg: UIImage! = UIImage(imageLiteralResourceName: "Default_Weather_Icon")
    var weatherType: WeatherTypes! = .Sunny
    var weather: String! = "-"
    var weatherDescription: String! = "-"
    var location: String! = "UNKNOWN LOCATION"
    var feelLikeTemp: Double! = 0
    var minTemp: Double! = 0
    var maxTemp: Double! = 0
    var windSpeed: Double! = 0
    var humidity: Double! = 0
}
