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
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 20)
                Text(upperText)
                    .font(.headline)
                    .foregroundColor(.secondary)
                Text(title)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                Text(bottomText)
                    .foregroundColor(.secondary)
                Spacer()
                    .frame(height: 20)
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
