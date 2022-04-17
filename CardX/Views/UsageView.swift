//
//  UsageView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/16.
//

import SwiftUI

struct UsageView: View {
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                WebView(url: URL(string: "https://support.apple.com/en-il/HT207122")!)
                    .background(.clear)
            }
            .navigationTitle("How to use")
        }
    }
}

struct UsageView_Previews: PreviewProvider {
    static var previews: some View {
        UsageView()
    }
}
