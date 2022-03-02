//
//  RandomQuoteCard.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/3/1.
//

import SwiftUI
import SwiftUIVisualEffects

struct RandomQuoteCard: View {
    @ObservedObject var vm = RandomQuoteCardViewModel()
    
    var body: some View {
        ZStack{
            AsyncImage(
                url: URL(string: (self.vm.quote.contents?.quotes?[0].background) ?? "-"),
                content: {image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(-30)
                        .blurEffect()
                        .blurEffectStyle(.regular)
                },
                placeholder: {
                    Image("Image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(-30)
                        .blurEffect()
                        .blurEffectStyle(.regular)
                })
                .frame(height: 150)
            HStack{
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 20)
                    Text((self.vm.quote.contents?.quotes?[0].author) ?? "unknown")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text((self.vm.quote.contents?.quotes?[0].date) ?? "1970-00-00")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Text((self.vm.quote.contents?.quotes?[0].quote) ?? "hmm...I can't find any quote.")
                        .font(.body)
                        .fontWeight(.black)
                        .lineLimit(3)
                        .vibrancyEffect()
                        .vibrancyEffectStyle(.fill)
                    Spacer()
                        .frame(height: 20)
                }
                .layoutPriority(100)
                Spacer()
            }
            .padding()
        }
        .cornerRadius(20)
        .padding([.top, .horizontal])
        .onAppear{
            vm.loadRandomQuote()
        }
    }
}

struct RandomQuoteCard_Previews: PreviewProvider {
    static var previews: some View {
        RandomQuoteCard()
    }
}
