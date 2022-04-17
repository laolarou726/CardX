//
//  HomePageCardModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/16.
//

import Foundation
import SwiftUI

class HomePageCardModel {
    public private(set) var sysIcon: String! = "star.fill"
    public private(set) var texts: [String]! = ["I", "don't", "know"]
    public private(set) var colors:  [Color]! = [.orange, .yellow]
    public private(set) var link: String! = "https://google.com/"
    
    init(_ sysIcon: String, _ texts: [String], _ colors: [Color], _ link: String){
        self.sysIcon = sysIcon
        self.texts = texts
        self.colors = colors
        self.link = link
    }
}
