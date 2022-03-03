//
//  ContentView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/1/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            VStack{
                RandomQuoteCard()
                CountDownCard()
                RandomWordCard()
                WeatherCard()
                HStack{
                    DefaultCard()
                    DefaultCard()
                }
                Text("x")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
