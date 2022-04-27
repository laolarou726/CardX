//
//  CardXApp.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/1/26.
//

import SwiftUI

@main
struct CardXApp: App {
    @StateObject private var tabController = TabController()
    @State var quoteJsonModel: RandomQuoteJsonModel?
    @State var ufJsonModel: UselessFactsJsonModel?
    @State var tihJsonModel: TodayInHistoryJsonModel?
    @State var movieJsonModel: MovieJsonModel?
    
    let moviePrefix = "widget-deeplink://movie/"
    let tihPrefix = "widget-deeplink://tih/"
    let ufPrefix = "widget-deeplink://uf/"
    let quotePrefix = "widget-deeplink://quote/"
    
    var body: some Scene {
        WindowGroup {
            RootView(quote: $quoteJsonModel, uf: $ufJsonModel, tih: $tihJsonModel, movie: $movieJsonModel)
                .onOpenURL { (url) in
                    if url.absoluteString.starts(with: moviePrefix){
                        tabController.open(.movieDetail)
                        
                        let base64Str = url.absoluteString.substring(from: moviePrefix.count)
                        self.movieJsonModel = MovieJsonModel.deserialize(from: base64Str.fromBase64())
                        
                        return
                    }
                    
                    if url.absoluteString.starts(with: tihPrefix){
                        tabController.open(.todayInHistory)
                        
                        let base64Str = url.absoluteString.substring(from: tihPrefix.count)
                        self.tihJsonModel = TodayInHistoryJsonModel.deserialize(from: base64Str.fromBase64())
                        
                        return
                    }
                    
                    if url.absoluteString.starts(with: ufPrefix){
                        tabController.open(.uselessFacts)
                        
                        let base64Str = url.absoluteString.substring(from: ufPrefix.count)
                        self.ufJsonModel = UselessFactsJsonModel.deserialize(from: base64Str.fromBase64())
                        
                        return
                    }
                    
                    if url.absoluteString.starts(with: quotePrefix){
                        tabController.open(.quoteDetail)
                        
                        let base64Str = url.absoluteString.substring(from: quotePrefix.count)
                        self.quoteJsonModel = RandomQuoteJsonModel.deserialize(from: base64Str.fromBase64())
                        
                        return
                    }
                    
                    tabController.open(.home)
                }
                .environmentObject(tabController)
        }
    }
}
