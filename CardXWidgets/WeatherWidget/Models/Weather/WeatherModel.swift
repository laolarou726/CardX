//
//  WeatherModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/3/2.
//

import Foundation
import HandyJSON

class WeatherModel : HandyJSON{
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
    
    required init() {}
}
