//
//  RandomHelper.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/1/27.
//

import Foundation
import UIKit

public class RandomHelper{
    static func randomOffset(size: CGSize) -> CGSize {
            
            // Do your works here!
            
            let width: CGFloat = CGFloat.random(in: 0.0...size.width)
            let height: CGFloat = CGFloat.random(in: 0.0...size.height)
            
            return CGSize(width: width, height: height)
    }
}
