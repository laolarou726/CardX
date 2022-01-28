//
//  RainyShape.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/1/27.
//

import SwiftUI

struct RainyShape: View {
    var body: some View {
        ZStack{
            GeometryReader { proxy in
                ForEach(0...25, id:\.self) { index in
                    Rectangle()
                        .fill(.blue)
                        .opacity(0.15)
                        .frame(width: 8)
                        .offset(RandomHelper.randomOffset(size: proxy.size))
                    Rectangle()
                        .fill(.cyan)
                        .opacity(0.05)
                        .frame(width: 5)
                        .offset(RandomHelper.randomOffset(size: proxy.size))
                    Rectangle()
                        .fill(.white)
                        .opacity(0.25)
                        .frame(width: 10)
                        .offset(RandomHelper.randomOffset(size: proxy.size))
                }
            }
        }
        .frame(width: 160, height:80, alignment: .center)
    }
}

struct RainyShape_Previews: PreviewProvider {
    static var previews: some View {
        RainyShape()
    }
}
