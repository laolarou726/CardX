//
//  RandomPokemonEntry.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/29.
//

import UIKit
import Foundation
import WidgetKit
import SwiftUI

struct RandomPokemonEntry : TimelineEntry{
    var date: Date
    var configuration: PokemonSettingsIntent
    
    var name: String! = "UNKNOWN"
    var height: String! = "- m"
    var weight: String! = "- kg"
    var types: [String]! = ["-"]
    var stats: [StatModel]! = []
    var backgroundColor: Color! = .yellow
    var image: UIImage! = UIImage(imageLiteralResourceName: "Pokemon")
    var jsonStr: String! = "-"
}
