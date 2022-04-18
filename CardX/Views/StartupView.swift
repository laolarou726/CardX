//
//  StartupView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/17.
//

import SwiftUI

struct StartupView: View {
    var body: some View {
        ZStack{
            Image("LaunchScreenImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .padding(-10)
        .ignoresSafeArea()
    }
}

struct StartupView_Previews: PreviewProvider {
    static var previews: some View {
        StartupView()
    }
}
