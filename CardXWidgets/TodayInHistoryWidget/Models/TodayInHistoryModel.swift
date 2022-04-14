//
//  TodayInHistoryModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import Foundation
import HandyJSON

class TodayInHistoryModel : HandyJSON{
    var date: String?
    var url:String?
    var data: [String:[HistoryDataModel]]?
    
    required init() {}
}
