//
//  MovieDetailView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/26.
//

import SwiftUI
import SwiftUIVisualEffects
import Alamofire

struct MovieDetailView: View {
    @Binding var model: MovieJsonModel?
    @State var navigate: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Spacer()
                    AsyncImage(url: URL(string: model?.imgUrl ?? "-"), content: {
                        image in
                        
                        image
                            .resizable()
                            .shadow(radius: 10)
                            .cornerRadius(8)
                            .frame(width: 84.25, height: 125)
                    }, placeholder: {
                        Image("Default_IMDB_Image_1")
                            .resizable()
                            .shadow(radius: 10)
                            .cornerRadius(8)
                            .frame(width: 84.25, height: 125)
                    })
                    VStack(alignment: .leading){
                        HStack{
                            Text(model?.typeAndCountry ?? "-")
                                .font(.footnote)
                            Spacer()
                            Text(model?.year ?? "-")
                                .font(.footnote)
                                .padding([.trailing])
                        }
                        Text(model?.title ?? "-")
                            .bold()
                            .font(.title)
                            .vibrancyEffect()
                        HStack{
                            Text(model?.time ?? "-")
                                .font(.system(size: 10))
                            Spacer()
                            ZStack{
                                Text(model?.imdbRating ?? "-")
                                    .foregroundColor(.white)
                                    .font(.system(size: 10))
                                    .padding([.leading, .trailing], 4)
                                    .padding([.top, .bottom], 1)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                .fill(.blue))
                            ZStack{
                                Text(model?.rottenRating ?? "-")
                                    .foregroundColor(.white)
                                    .font(.system(size: 10))
                                    .padding([.leading, .trailing], 4)
                                    .padding([.top, .bottom], 1)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                .fill(.pink))
                            .padding([.trailing])
                        }
                    }
                    .padding([.horizontal], 4)
                }
                .padding()
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Description")
                            .bold()
                            .font(.title)
                        Text(model?.description ?? "-")
                            .padding()
                    }
                    Spacer()
                }
                .padding()
                .padding([.horizontal], 4)
                
                Spacer()
            }
            .background(
                ZStack{
                    AsyncImage(url: URL(string: model?.imgUrl ?? "-"), content: {
                        image in
                        
                        image
                            .blurEffect()
                            .blurEffectStyle(.regular)
                    }, placeholder: {
                        Image("Default_IMDB_Image_1")
                            .blurEffect()
                            .blurEffectStyle(.regular)
                    })
                })
            .navigationTitle("Movie")
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(model: .constant(MovieJsonModel()))
    }
}
