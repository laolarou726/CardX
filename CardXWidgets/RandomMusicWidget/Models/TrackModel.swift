//
//  TrackModel.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/14.
//

import Foundation
import HandyJSON

class ArModel : HandyJSON{
    var id: Int?
    var name: String?
    
    required init() {}
}

class AlModel : HandyJSON{
    var id: Int?
    var name: String?
    var picUrl: String?
    var pic_str: String?
    var pic: Int?
    
    required init() {}
}

class TrackModel : HandyJSON{
    var name: String?
    var al: AlModel?
    var ar: [ArModel]?
    var pop: Int?
    var mark: Int?
    
    required init() {}
}
