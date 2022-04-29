//
//  WidgetDetailView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/17.
//

import SwiftUI
import SwiftUIVisualEffects

struct WidgetDetailView: View {
    @Binding var widgetName: String
    
    var body: some View {
        ZStack{
            HStack{
                Spacer()
                
                VStack(alignment: .center){
                    Spacer()
                    Image("\(widgetName.filter({!$0.isWhitespace}))Preview")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(radius: 10)
                    Text(LocalizedStringKey(widgetName).stringValue())
                        .font(.title)
                        .bold()
                        .padding()
                    Text("This is only the preview for this widget.")
                        .foregroundColor(.secondary)
                        .font(.footnote)
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

struct WidgetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetDetailView(widgetName: .constant("TodayInHistoryWidget"))
    }
}
