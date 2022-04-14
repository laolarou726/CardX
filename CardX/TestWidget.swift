//
//  TestWidget.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import SwiftUI

struct TestWidget: View {
    var body: some View {
        ZStack{
            HStack{
                Spacer()
                Image("t")
                    .resizable()
                    .shadow(radius: 10)
                    .cornerRadius(8)
                    .frame(width: 84.25, height: 125)
                VStack(alignment: .leading){
                    Spacer()
                    HStack{
                        Text("Movie | USA")
                            .font(.footnote)
                        Spacer()
                        Text("1994")
                            .font(.footnote)
                            .padding([.trailing])
                    }
                    Text("The Shawshank Redemption")
                        .bold()
                        .lineLimit(2)
                    Text("Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                    HStack{
                        Text("142 mins")
                            .font(.system(size: 10))
                        Spacer()
                        ZStack{
                            Text("IMDB 9.3")
                                .foregroundColor(.white)
                                .font(.system(size: 10))
                                .padding([.leading, .trailing], 4)
                                .padding([.top, .bottom], 1)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                            .fill(.blue))
                        ZStack{
                            Text("Rotten 91%")
                                .foregroundColor(.white)
                                .font(.system(size: 10))
                                .padding([.leading, .trailing], 4)
                                .padding([.top, .bottom], 1)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                            .fill(.pink))
                        .padding([.trailing])
                    }
                    Spacer()
                }
                .padding([.horizontal], 4)
                Spacer()
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(radius: 10))
        .frame(width: 360, height: 169)
    }
}

struct TestWidget_Previews: PreviewProvider {
    static var previews: some View {
        TestWidget()
    }
}
