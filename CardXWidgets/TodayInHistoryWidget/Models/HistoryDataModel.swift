//
//  HistoryDataModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import Foundation
import HandyJSON

class HistoryDataModel : HandyJSON{
    var year: String?
    var text: String?
    var html: String?
    var no_year_html: String?
    var links: [LinkModel]?
    
    required init() {}
}
