//
//  RandomPhotoModel.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/14.
//

import Foundation
import HandyJSON

class RandomPhotoModel : HandyJSON{
    var id: String?
    var color: String!
    var blur_hash: String!
    var description: String?
    var urls: [String:String]?
    var likes: Int?
    var exif: ExifModel?
    var views: Int?
    var downloads: Int?
    
    required init() {}
}
