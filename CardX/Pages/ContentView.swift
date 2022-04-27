//
//  ContentView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/1/26.
//

import SwiftUI

struct ContentView: View {
    @State var isShowed = false
    @State var isPresented = false
    @State var isVisible = true
    @State private var selectedTab = 0
    
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
        .opacity(!isVisible ? 1 : 0)
        .fullScreenCover(isPresented: $isPresented, content: {
            StartupView()
        })
        .onAppear{
            if(self.isShowed){
                return
            }
            
            self.isShowed = true
            self.isPresented.toggle()
            UITabBar.appearance().isHidden = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeInOut(duration: 0.45)){
                    self.isVisible = false
                    self.isPresented = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
