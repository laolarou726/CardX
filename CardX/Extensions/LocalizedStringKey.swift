//
//  LocalizedStringKey.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/29.
//

import Foundation
import SwiftUI

extension LocalizedStringKey {
    var stringKey: String {
        let description = "\(self)"
        
        let components = description.components(separatedBy: "key: \"")
            .map { $0.components(separatedBy: "\",") }
        
        return components[1][0]
    }
    
    func stringValue(locale: Locale = .current) -> String {
        if(locale.languageCode == "en"){
            return self.stringKey;
        }
        
        return .localizedString(for: self.stringKey, locale: locale)
    }
}

extension String{
    static func localizedString(for key: String,
                                locale: Locale = .current) -> String {
        let language = locale.variantCode
        let path = (Bundle.main.path(forResource: language, ofType: "lproj") ?? Bundle.main.path(forResource: "en", ofType: "lproj"))!
        let bundle = Bundle(path: path)!
        let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")
        
        return localizedString
    }
}
