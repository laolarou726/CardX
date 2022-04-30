//
//  ColorHelper.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/29.
//

import Foundation
import SwiftUI

class ColorHelper{
    public static func getColor(_ str: String) -> Color{
        switch(str){
        case "yellow":
            return .yellow
        case "black":
            return .secondary
        case "blue":
            return .blue
        case "brown":
            return .brown
        case "gray":
            return .gray
        case "green":
            return .green
        case "pink":
            return .pink
        case "purple":
            return .purple
        case "red":
            return .red
        case "white":
            return .white
        default:
            return Color.accentColor
        }
    }
}
