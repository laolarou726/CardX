//
//  ContentModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/3/1.
//

import Foundation
import HandyJSON

class QuoteContentModel : HandyJSON{
    var quote: String?
    var length: String?
    var author: String?
    var tags: [String]?
    var category: String?
    var language: String?
    var date: String? = "-"
    var permalink: String?
    var id: String?
    var background: String?
    var title: String?
    
    required init() {}
}

class QuoteContentsModel : HandyJSON{
    var quotes: [QuoteContentModel]?
    
    required init() {}
}
