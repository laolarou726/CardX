//
//  PokemontTypeModel.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/29.
//

import Foundation
import HandyJSON

class PokemontTypeModel : HandyJSON{
    var slot: Int?
    var type: PokemonInfoLinkModel?
    
    required init() {}
}
