//
//  RootView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/26.
//

import SwiftUI

struct RootView: View {
    @Binding var host: MovieJsonModel?
    @Binding var viewType: ViewType
    
    var body: some View {
        switch(viewType){
        case .home:
            ContentView()
        case .movieDetail:
            MovieDetailView(model: $host)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(host: .constant(MovieJsonModel()), viewType: .constant(.home))
    }
}
