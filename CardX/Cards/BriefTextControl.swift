//
//  BriefTextControl.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/2/3.
//

import SwiftUI

struct BriefTextControl: View {
    let upperText: String
    let title: String
    let bottomText: String
    
    var body: some View {
        HStack{
            Spacer()
            VStack(alignment: .leading) {
                Spacer()
                Text(upperText)
                    .font(.headline)
                    .foregroundColor(.secondary)
                Text(title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                    .font(.system(size: 500))
                    .minimumScaleFactor(0.01)
                Text(bottomText)
                    .font(.footnote)
                Spacer()
            }
            .layoutPriority(100)
            Spacer()
        }
        .padding()
    }
}

struct BriefTextControl_Previews: PreviewProvider {
    static var previews: some View {
        BriefTextControl(upperText: "test", title: "test", bottomText: "test")
    }
}
