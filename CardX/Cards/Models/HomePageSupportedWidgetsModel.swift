//
//  HomePageSupportedWidgetsModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/17.
//

import Foundation

class HomePageSupportedWidgetsModel{
    public private(set) var section: String! = "other"
    public private(set) var items: [String]! = ["-"]
    
    init(_ section: String, _ items: [String]){
        self.section = section
        self.items = items
    }
}
