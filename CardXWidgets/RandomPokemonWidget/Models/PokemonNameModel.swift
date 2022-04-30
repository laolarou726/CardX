//
//  PokemonNameModel.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/29.
//

import Foundation
import HandyJSON

class PokemonNameModel : HandyJSON{
    var name: String?
    var language: PokemonInfoLinkModel?
    
    required init() {}
}
