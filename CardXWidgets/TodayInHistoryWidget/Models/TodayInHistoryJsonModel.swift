//
//  TodayInHistoryJsonModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/27.
//

import Foundation
import HandyJSON

class TodayInHistoryJsonModel : HandyJSON{
    var type: String! = "UNKNOWN"
    var year: String! = "-"
    var history: String! = "-"
    
    required init() {}
}
