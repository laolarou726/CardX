//
//  RandomPhotoEntry.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/14.
//

import UIKit
import Foundation
import WidgetKit

struct RandomPhotoEntry : TimelineEntry{
    var date: Date
    var configuration: RandomPhotoSettingsIntent
    
    var image: UIImage! = UIImage(imageLiteralResourceName: "Image")
    var exifName: String! = ""
    var color: String! = "#000000"
}
