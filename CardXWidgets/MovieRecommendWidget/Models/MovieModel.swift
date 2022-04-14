//
//  MovieModel.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import Foundation
import HandyJSON

class MovieModel : HandyJSON{
    var data: [MovieDataModel]?
    var createdAt: Int?
    var updatedAt: Int?
    var id: String?
    var originalName: String?
    var imdbVotes: Int?
    var imdbRating: String?
    var rottenRating: String?
    var rottenVotes: Int?
    var year: String?
    var imdbId: String?
    var alias: String?
    var doubanId: String?
    var type: String?
    var doubanRating: String?
    var doubanVotes: Int?
    var duration: Int?
    var dateReleased: String?
    
    required init() {}
}
