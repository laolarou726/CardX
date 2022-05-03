//
//  RootView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/26.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var tabController: TabController
    @Binding var quote: RandomQuoteJsonModel?
    @Binding var uf: UselessFactsJsonModel?
    @Binding var tih: TodayInHistoryJsonModel?
    @Binding var movie: MovieJsonModel?
    @Binding var pokemon: PokemonJsonModel?
    
    var body: some View {
        TabView(selection: $tabController.activeTab){
            ContentView()
                .tag(ViewType.home)
                .navigationBarBackButtonHidden(true)
            
            MovieDetailView(model: $movie)
                .tag(ViewType.movieDetail)
                .navigationBarBackButtonHidden(true)
            
            TodayInHistoryDetailView(model: $tih)
                .tag(ViewType.todayInHistory)
                .navigationBarBackButtonHidden(true)
            
            UselessFactsDetailView(model: $uf)
                .tag(ViewType.uselessFacts)
                .navigationBarBackButtonHidden(true)
            
            RandomQuoteDetailView(model: $quote)
                .tag(ViewType.quoteDetail)
                .navigationBarBackButtonHidden(true)
            
            RandomPokemonDetailView(model: $pokemon)
                .tag(ViewType.pokemonDetail)
                .navigationBarBackButtonHidden(true)
        }
        .environmentObject(tabController)
        
        .onAppear{
            UITabBar.appearance().isHidden = true
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(quote: .constant(nil), uf: .constant(nil), tih: .constant(nil), movie: .constant(nil), pokemon: .constant(nil))
    }
}
