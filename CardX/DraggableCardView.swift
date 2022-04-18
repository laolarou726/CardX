//
//  DraggableCardView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/17.
//

import SwiftUI
import ExytePopupView
import SwiftUIVisualEffects

#if os(iOS)
struct DraggableCardView<Content: View>: View {

    let content: Content
    let topPadding: CGFloat
    let fixedHeight: Bool

    init(topPadding: CGFloat = 100, fixedHeight: Bool = false, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.topPadding = topPadding
        self.fixedHeight = fixedHeight
    }

    var body: some View {
        ZStack {
            ZStack{
                HStack{
                    Spacer()
                    VStack{
                        Spacer()
                    }
                }
            }
            .blurEffect()
            .blurEffectStyle(.regular)
            
            VStack {
                Color.white
                    .frame(width: 72, height: 6)
                    .clipShape(Capsule())
                    .padding(.top, 15)
                    .padding(.bottom, 10)
                
                content
                    .padding(.bottom, 30)
                    .applyIf(fixedHeight) {
                        $0.frame(height: UIScreen.main.bounds.height - topPadding)
                    }
                    .applyIf(!fixedHeight) {
                        $0.frame(maxHeight: UIScreen.main.bounds.height - topPadding)
                    }
            }
        }
        .cornerRadius(40, corners: [.topLeft, .topRight])
        .fixedSize(horizontal: false, vertical: true)
    }
}
#endif
