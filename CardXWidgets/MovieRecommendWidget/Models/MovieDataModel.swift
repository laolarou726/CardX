//
//  MovieDataModel.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import Foundation
import HandyJSON

class MovieDataModel : HandyJSON{
    var createdAt: Int?
    var updatedAt: Int?
    var id: String?
    var poster: String?
    var name: String?
    var genre: String?
    var description: String?
    var language: String?
    var country: String?
    var lang: String?
    var shareImage: String?
    var movie: String?
    
    required init() {}
}
