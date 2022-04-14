//
//  SunnyShape.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/1/27.
//

import SwiftUI

struct SunnyShape: View {
    let circles : [CGFloat] = [
        1,
        0.8,
        0.6,
        0.4,
        0.3
    ];
    
    var body: some View {
        ZStack{
            ForEach(circles, id: \.self){
                circle in
                Circle()
                    .fill(.orange)
                    .opacity(0.45)
                    .aspectRatio(circle, contentMode: .fit)
            }
        }
        .frame(width: 160, height: 160, alignment: .center)
    }
}

struct SunnyShape_Previews: PreviewProvider {
    static var previews: some View {
        SunnyShape()
    }
}
