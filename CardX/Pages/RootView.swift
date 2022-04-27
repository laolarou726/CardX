//
//  RootView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/26.
//

import SwiftUI

struct RootView: View {
    @Binding var quote: RandomQuoteJsonModel?
    @Binding var uf: UselessFactsJsonModel?
    @Binding var tih: TodayInHistoryJsonModel?
    @Binding var movie: MovieJsonModel?
    @Binding var viewType: ViewType
    
    var body: some View {
        switch(viewType){
        case .home:
            ContentView()
        case .movieDetail:
            MovieDetailView(model: $movie)
        case .todayInHistory:
            TodayInHistoryDetailView(model: $tih)
        case .uselessFacts:
            UselessFactsDetailView(model: $uf)
        case .quoteDetail:
            RandomQuoteDetailView(model: $quote)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(quote: .constant(nil), uf: .constant(nil), tih: .constant(nil), movie: .constant(nil), viewType: .constant(.home))
    }
}
