//
//  MovieRecommendEntry.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import UIKit
import Foundation
import WidgetKit

struct MovieRecommendEntry : TimelineEntry{
    var date: Date
    var configuration: ConfigurationIntent
    
    var movieImg: UIImage! = UIImage(imageLiteralResourceName: "Default_IMDB_Image")
    
    var title: String! = "-"
    var description: String! = "-"
    
    var typeAndCountry: String! = "- | -"
    var year: String! = "-"
    
    var time: String! = "- mins"
    var imdbRating: String! = "IMDB -"
    var rottenRating: String! = "Rotten -"
}
