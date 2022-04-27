//
//  TodayInHistoryDetailView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/27.
//

import SwiftUI
import SwiftUIVisualEffects

struct TodayInHistoryDetailView: View {
    @EnvironmentObject private var tabController: TabController
    @Binding var model: TodayInHistoryJsonModel?
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    Text("Today")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal, 5)
                        .background(.pink)
                    Text("In")
                        .font(.title)
                        .bold()
                    Text("History")
                        .font(.title)
                        .bold()
                }
                .padding()
                
                List{
                    Section(header: Text("Year")){
                        Text(model?.year ?? "-")
                    }
                    Section(header: Text("Event Type")){
                        Text(model?.type ?? "-")
                    }
                }
                .frame(height: 250)
                .listStyle(.insetGrouped)
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Description")
                            .bold()
                            .font(.title)
                        Text(model?.history ?? "-")
                            .padding()
                    }
                    Spacer()
                }
                .padding()
                .padding([.horizontal], 4)
                
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
            
            Spacer()
        }
        .background(
            Image("Image-11")
                .blurEffect()
                .blurEffectStyle(.regular))
    }
}

struct TodayInHistoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodayInHistoryDetailView(model: .constant(nil))
    }
}
