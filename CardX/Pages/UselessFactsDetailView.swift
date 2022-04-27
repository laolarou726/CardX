//
//  UselessFactsDetailView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/27.
//

import SwiftUI

struct UselessFactsDetailView: View {
    @EnvironmentObject private var tabController: TabController
    @Binding var model: UselessFactsJsonModel?
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text(model?.facts ?? "-")
                        .padding()
                    
                    Spacer()
                }
                
                Spacer()
                
                Button(action: {
                    tabController.open(.home)
                }) {
                    Image(systemName: "arrowshape.turn.up.backward.2.fill")
                }
                .buttonStyle(GrowingButton())
                .shadow(radius: 10)
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color("WordCardGradient_2_1"), Color("WordCardGradient_2_2")]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .navigationTitle("Do you know?")
        }
    }
}

struct UselessFactsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UselessFactsDetailView(model: .constant(nil))
    }
}
