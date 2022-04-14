//
//  MultiProgressBar.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/14.
//

import SwiftUI

struct MultiProgressBar: View {
    var values: [(Double, Color, String)]
    
    init(_ values: [(Double, Color, String)]){
        let sum = values.map({$0.0}).reduce(0, +)
        let temp = values
            .map({($0.0 / sum, $0.1, $0.2)})
        var values: [(Double, Color, String)] = []
        
        var current = 0.0
        for val in temp{
            current += val.0
            values.append((current, val.1, val.2))
        }
        
        self.values = values.reversed()
    }
    
    var body: some View {
        VStack(alignment: .leading){
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width , height: geometry.size.height)
                        .opacity(0.3)
                        .foregroundColor(.gray)
                    ForEach(0..<self.values.count, id: \.self){
                        index in
                        
                        let value = self.values[index]
                        
                        Rectangle()
                            .frame(width: min(value.0 * geometry.size.width, geometry.size.width), height: geometry.size.height)
                            .foregroundColor(value.1)
                    }
                }
            }
            .cornerRadius(5)
            .frame(height: 10)
            
            LazyHStack(spacing: 10) {
                ForEach(0..<self.values.count, id: \.self) {
                    index in
                    
                    let value = self.values[index]
                    
                    HStack{
                        Rectangle()
                            .fill(value.1)
                            .cornerRadius(2)
                            .frame(width: 10, height: 10)
                        Text(value.2)
                            .font(.footnote)
                    }
                }
            }
        }
        .frame(height: 50)
    }
}

struct MultiProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        MultiProgressBar([
            (213, .red, "febsb"),
            (23, .blue, "sdfbsdb"),
            (23, .pink, "fdsbdsfb"),
            (23, .green, "sdfbdfsb")
        ])
    }
}
