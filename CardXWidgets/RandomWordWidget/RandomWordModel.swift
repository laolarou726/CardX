//
//  RandomWordModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/2/16.
//

import Foundation
import HandyJSON

class RandomWordModel : HandyJSON{
    var word: String? = "unknown"
    var definition: String? = "unknown means unknown"
    var pronunciation: String? = "[-]"
    
    required init() {}
}
