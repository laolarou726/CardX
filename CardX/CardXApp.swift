//
//  CardXApp.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/1/26.
//

import SwiftUI

@main
struct CardXApp: App {
    @State var jsonModel: MovieJsonModel?
    @State var viewType: ViewType = .home
    
    var body: some Scene {
        WindowGroup {
            RootView(host: $jsonModel, viewType: $viewType)
                .onOpenURL { (url) in
                    if url.absoluteString.starts(with: "widget-deeplink://"){
                        self.viewType = .movieDetail
                        self.jsonModel = MovieJsonModel.deserialize(from: url.host?.fromBase64())
                    }
                    else{
                        self.viewType = .home
                    }
                }
        }
    }
}
