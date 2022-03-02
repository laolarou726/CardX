//
//  RandomQuoteModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/3/1.
//

import Foundation
import HandyJSON

class RandomQuoteModel : HandyJSON{
    var baseurl: String?
    var contents: QuoteContentsModel?
    var copyright: CopyRight?
    
    required init() {}
}
