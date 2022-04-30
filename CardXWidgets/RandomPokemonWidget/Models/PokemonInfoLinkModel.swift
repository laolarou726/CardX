//
//  PokemonInfoLinkModel.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/29.
//

import Foundation
import HandyJSON

class PokemonInfoLinkModel : HandyJSON{
    var name: String?
    var url: String?
    
    required init() {}
}

class PokemonInfoLinkListModel : HandyJSON{
    var results: [PokemonInfoLinkModel]?
    
    required init() {}
}
