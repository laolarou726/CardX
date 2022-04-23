//
//  ViewExtension.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/22.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition { transform(self) }
        else { self }
    }
}
