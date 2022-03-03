//
//  WeatherResponseModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/3/2.
//

import Foundation
import HandyJSON

class WeatherResponseModel : HandyJSON{
    var coord: CoordinateModel?
    var weather: [WeatherModel]?
    var base: String?
    var main: MainModel?
    var wind: WindModel?
    var cloud: CloudModel?
    var dt: Int?
    var sys: SysModel?
    var timezone: Int?
    var id: Int?
    var name: String?
    var cod: Int?
    
    required init() {}
}
