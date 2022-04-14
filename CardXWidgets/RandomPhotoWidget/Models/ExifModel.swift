//
//  ExifModel.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/14.
//

import Foundation
import HandyJSON

class ExifModel : HandyJSON{
    var make: String?
    var model: String?
    var name: String?
    var exposure_time: String?
    var aperture: String?
    var focal_length: String?
    var iso: Int?
    
    required init() {}
}
