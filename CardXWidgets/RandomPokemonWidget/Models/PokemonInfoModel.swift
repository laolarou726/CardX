//
//  PokemonInfoModel.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/29.
//

import Foundation
import HandyJSON

class PokemonInfoModel : HandyJSON{
    var id: Int?
    var species: PokemonInfoLinkModel?
    var stats: [PokemonStatModel]?
    var name: String?
    var height: Int?
    var weight: Int?
    var types: [PokemontTypeModel]?
    
    required init() {}
}
