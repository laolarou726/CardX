//
//  RandomQuoteJsonModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/27.
//

import Foundation
import HandyJSON

class RandomQuoteJsonModel : HandyJSON{
    var quote: RandomQuoteModel! = RandomQuoteModel()
    var imgUrl: String! = "-"
    
    required init() {}
}
