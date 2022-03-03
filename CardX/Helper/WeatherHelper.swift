//
//  WeatherHelper.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/3/2.
//

import Foundation

public class WeatherHelper{
    static func getWeatherType(type: String?) -> WeatherTypes{
        switch type{
        case "Clear":
            return .Sunny
        case "Rain":
            return .Rainy
        case "Clouds":
            return .Cloudy
        default:
            return .Sunny
        }
    }
}
