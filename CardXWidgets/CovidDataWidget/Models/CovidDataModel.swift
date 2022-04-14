//
//  CovidDataModel.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/14.
//

import Foundation
import HandyJSON

class CovidDataModel : HandyJSON{
    var country: String?
    var state: String?
    var county: String?
    var population: Int?
    var hsaPopulation: Int?
    var actuals: ActualModel?
    
    required init() {}
}
