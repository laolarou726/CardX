//
//  RandomPokemonDetailView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/5/3.
//

import SwiftUI
import WrappingHStack

struct RandomPokemonDetailView: View {
    @EnvironmentObject private var tabController: TabController
    @Binding var model: PokemonJsonModel?
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        HStack{
                            Text(model?.height ?? "-")
                                .font(.footnote)
                                .foregroundColor(.black.opacity(0.6))
                            Text(model?.weight ?? "-")
                                .font(.footnote)
                                .foregroundColor(.black.opacity(0.6))
                        }
                        
                        Text(model?.name ?? "-")
                            .font(.title)
                            .foregroundColor(.black)
                            .bold()
                        
                        WrappingHStack{
                            ForEach(0..<(model?.types.count ?? 1), id: \.self){
                                index in
                                
                                Text(model?.types[index] ?? "-")
                                    .padding(.horizontal, 3)
                                    .padding(.vertical, 2)
                                    .foregroundColor(Color(UIColor.systemBackground))
                                    .background(.primary)
                                    .cornerRadius(5)
                            }
                            .padding(2)
                        }
                        .frame(maxWidth: 150, alignment: .leading)
                        .clipped()
                    }
                    .padding()
                    
                    Spacer()
                    
                    AsyncImage(url: URL(string: model?.imageUrl ?? "-"), content: {
                        image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .padding()
                    }, placeholder: {
                        ProgressView()
                            .frame(width: 100, height: 100)
                    })
                }
                
                List{
                    ForEach(0..<(model?.stats.count ?? 0), id: \.self){
                        index in
                        
                        let stat = model?.stats[index]
                        
                        VStack(alignment: .leading){
                            Text("\(stat?.key ?? "-") (\(stat?.value ?? 0)/100)")
                                .font(.footnote)
                            MultiProgressBar([
                                (Double(stat?.value ?? 0), .black, ""),
                                (Double(100 - (stat?.value ?? 0)), .gray, "")], false)
                            .frame(height: 10)
                        }
                        .padding(.horizontal)
                    }
                    .listRowBackground(BlurView(style: .light))
                }
                .listStyle(.insetGrouped)
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
                .clipped()
                
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
            .background(
                Rectangle()
                    .fill(ColorHelper.getColor(model?.backgroundColor ?? "-"))
                .ignoresSafeArea(.all))
            .navigationTitle("Pokemon Detail")
        }
    }
}

struct RandomPokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RandomPokemonDetailView(model: .constant(nil))
    }
}
