//
//  RandomWordCard.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/2/16.
//

import SwiftUI

struct RandomWordCard: View {
    @ObservedObject var vm = RandomWordCardViewModel()
    
    var body: some View {
        ZStack{
            BriefTextControl(
                upperText: self.vm.word.pronunciation!,
                title: self.vm.word.word!,
                bottomText: self.vm.word.definition!)
        }
        .cornerRadius(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [Color("WordCardGradient_1_1"), Color("WordCardGradient_1_2")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(radius: 10))
        .padding([.top, .horizontal])
        .onAppear{
            vm.loadRandomWord()
        }
    }
}

struct RandomWordCard_Previews: PreviewProvider {
    static var previews: some View {
        RandomWordCard()
    }
}
