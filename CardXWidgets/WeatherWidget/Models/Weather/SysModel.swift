//
//  SyModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/3/2.
//

import Foundation
import HandyJSON

class SysModel : HandyJSON{
    var type: Int?
    var id: Int?
    var message: Double?
    var country: String?
    var sunrise: Int?
    var sunset: Int?
    
    required init() {}
}
