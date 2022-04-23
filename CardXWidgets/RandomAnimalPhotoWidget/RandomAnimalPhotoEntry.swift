//
//  RandomDogPhotoEntry.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/22.
//

import UIKit
import Foundation
import WidgetKit

struct RandomAnimalEntry : TimelineEntry{
    var date: Date
    var configuration: RandomAnimalSettingsIntent
    
    var image: UIImage! = UIImage(imageLiteralResourceName: "DogImage")
}
