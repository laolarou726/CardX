//
//  MainModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/3/2.
//

import Foundation
import HandyJSON

class MainModel : HandyJSON{
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Double?
    var humidity: Double?
    
    required init() {}
}
