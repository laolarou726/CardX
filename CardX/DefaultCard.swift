//
//  DefaultCard.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/1/26.
//

import SwiftUI

struct DefaultCard: View {
    var body: some View {
        VStack{
            Image("Image")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack{
                VStack(alignment: .leading) {
                    Text("MC")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text("TEST")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text("TEST")
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                //将VStack 推到左侧
                Spacer()
            }
            .padding()
        }
        .cornerRadius(20)
        .padding([.top, .horizontal])
    }
}

struct DefaultCard_Previews: PreviewProvider {
    static var previews: some View {
        DefaultCard()
    }
}
