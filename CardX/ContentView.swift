//
//  ContentView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/1/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0;
    
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            UsageView()
                .tabItem{
                    Image(systemName: "books.vertical.fill")
                    Text("Usage")
                }
                .tag(0)
            
            AboutView()
                .tabItem{
                    Image(systemName: "info.circle")
                    Text("About")
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
