//
//  PokemonStatModel.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/29.
//

import Foundation
import HandyJSON

class PokemonStatModel : HandyJSON{
    var base_stat: Int?
    var effort: Int?
    var stat: PokemonInfoLinkModel?
    
    required init() {}
}
