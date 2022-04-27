//
//  ImageExtension.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/26.
//

import Foundation
import UIKit

extension UIImage {
    func toBase64() -> String? {
        guard let imageData = self.pngData() else { return nil }
        return imageData.base64EncodedString(options: .lineLength64Characters)
    }
}
