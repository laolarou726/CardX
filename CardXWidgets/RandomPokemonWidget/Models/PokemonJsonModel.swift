//
//  PokemonJsonModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/5/3.
//

import Foundation
import HandyJSON
import SwiftUI

class StatModel : HandyJSON{
    var key: String?
    var value: Int?
    
    required init() {}
}

class PokemonJsonModel : HandyJSON{
    var name: String! = "UNKNOWN"
    var height: String! = "- m"
    var weight: String! = "- kg"
    var types: [String]! = ["-"]
    var stats: [StatModel]! = []
    var backgroundColor: String! = "yellow"
    var imageUrl: String! = "-"
    
    required init() {}
}
