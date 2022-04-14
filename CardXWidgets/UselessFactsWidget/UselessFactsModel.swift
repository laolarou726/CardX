//
//  UselessFactsModel.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import Foundation
import HandyJSON

class UselessFactsModel : HandyJSON{
    var id: String?
    var text: String?
    var source: String?
    var source_url: String?
    var language: String?
    var permalink: String?
    
    required init() {}
}
