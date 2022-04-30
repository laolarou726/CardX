//
//  PokemonSpeciesModel.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/29.
//

import Foundation
import HandyJSON

class PokemonSpeciesModel : HandyJSON{
    var color: PokemonInfoLinkModel?
    var id: Int?
    var name: String?
    var names: [PokemonNameModel]?
    
    
    required init() {}
}
