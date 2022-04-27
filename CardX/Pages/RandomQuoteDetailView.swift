//
//  RandomQuoteDetailView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/27.
//

import SwiftUI
import SwiftUIVisualEffects

struct RandomQuoteDetailView: View {
    @EnvironmentObject private var tabController: TabController
    @Binding var model: RandomQuoteJsonModel?
    
    var body: some View {
        NavigationView{
            HStack{
                VStack(alignment: .leading) {
                    Text((model?.quote?.contents?.quotes?[0].author) ?? "unknown")
                        .font(.footnote)
                    Text((model?.quote?.contents?.quotes?[0].date) ?? "1970-00-00")
                        .font(.footnote)
                    Text((model?.quote?.contents?.quotes?[0].quote) ?? "hmm...I can't find any quote.")
                        .fontWeight(.black)
                        .vibrancyEffect()
                    Spacer()
                    
                    HStack{
                        Spacer()
                        
                        Button(action: {
                            tabController.open(.home)
                        }) {
                            Image(systemName: "arrowshape.turn.up.backward.2.fill")
                        }
                        .buttonStyle(GrowingButton())
                        .shadow(radius: 10)
                        
                        Spacer()
                    }
                }
                .padding()
                .padding(.horizontal)
                
                Spacer()
            }
            .background(
                Image("Image")
                    .blurEffect()
                    .blurEffectStyle(.regular))
            .navigationTitle("Today's quote")
        }
    }
}

struct RandomQuoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RandomQuoteDetailView(model: .constant(nil))
    }
}
