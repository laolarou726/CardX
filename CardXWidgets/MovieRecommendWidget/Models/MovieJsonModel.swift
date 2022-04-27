//
//  MovieJsonModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/26.
//

import Foundation
import HandyJSON
import Alamofire

class MovieJsonModel : HandyJSON, ObservableObject, Equatable{
    static func == (lhs: MovieJsonModel, rhs: MovieJsonModel) -> Bool {
        return lhs.title == rhs.title &&
        lhs.description == rhs.description &&
        lhs.typeAndCountry == rhs.typeAndCountry &&
        lhs.year == rhs.year &&
        lhs.time == rhs.time &&
        lhs.imdbRating == rhs.imdbRating &&
        lhs.rottenRating == rhs.rottenRating
    }
    
    var imgUrl: String! = "-"
    
    var title: String! = "-"
    var description: String! = "-"
    
    var typeAndCountry: String! = "- | -"
    var year: String! = "-"
    
    var time: String! = "- mins"
    var imdbRating: String! = "IMDB -"
    var rottenRating: String! = "Rotten -"
    
    required init() {}
}
