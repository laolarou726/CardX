//
//  CloudyShape.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/1/27.
//

import SwiftUI

struct CloudyShape: View {
    var body: some View {
        ZStack{
            GeometryReader { proxy in
                ForEach(0...25, id:\.self) { index in
                    Circle()
                        .fill(.black)
                        .opacity(0.05)
                        .frame(width: 40)
                        .offset(RandomHelper.randomOffset(size: proxy.size))
                    Circle()
                        .fill(.gray)
                        .opacity(0.05)
                        .frame(width: 30)
                        .offset(RandomHelper.randomOffset(size: proxy.size))
                    Circle()
                        .fill(.white)
                        .opacity(0.25)
                        .frame(width: 20)
                        .offset(RandomHelper.randomOffset(size: proxy.size))
                }
            }
            
        }
        .frame(width: 160, height:80, alignment: .center)
    }
}

struct CloudyShape_Previews: PreviewProvider {
    static var previews: some View {
        CloudyShape()
    }
}
