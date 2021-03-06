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
            ZStack{
                VStack(alignment: .center){
                    ProgressView()
                    Text("loading")
                        .foregroundColor(.secondary)
                        .padding()
                }
                WebView(url: URL(string: LocalizedStringKey("https://support.apple.com/en-us/HT207122").stringValue())!)
                    .background(.clear)
            }
            .navigationTitle("How to use")
        }
        .navigationViewStyle(.stack)
    }
}

struct UsageView_Previews: PreviewProvider {
    static var previews: some View {
        UsageView()
    }
}
