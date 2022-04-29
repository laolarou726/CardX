//
//  AboutView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/16.
//

import SwiftUI

struct AboutView: View {
    let authors: [(String, String)] = [
        ("Paul Luo", "https://github.com/laolarou726"),
        ("Tina Wang", "https://github.com/pudding2718")
    ]
    let apiLinks: [(String, String)] = [
        ("OpenWeatherAPI", "https://openweathermap.org/"),
        ("CovidActNow Data", "https://covidactnow.org/"),
        ("Random Word API", "https://random-words-api.vercel.app/"),
        ("Random Quote API", "https://quotes.rest/"),
        ("Movie Recommand API", "https://api.wmdb.tv/"),
        ("Useless Facts API", "https://uselessfacts.jsph.pl/"),
        ("Today in History API", "https://history.muffinlabs.com/"),
        ("Random Music API", "https://netease-cloud-music-api-sigma-taupe.vercel.app/"),
        ("Unsplash API", "https://api.unsplash.com/")
        
    ]
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                List{
                    Section{
                        HStack{
                            Image("Icon")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                                .padding([.trailing, .vertical])
                            
                            VStack(alignment: .leading){
                                Text("CardX")
                                    .font(.title)
                                    .bold()
                                Text("A lightweight widget library for iPhone and iPad")
                                    .foregroundColor(.secondary)
                                    .font(.footnote)
                            }
                        }
                    }
                    
                    Section(header: Text("Authors")){
                        ForEach(0..<self.authors.count, id: \.self){
                            index in
                            
                            let item = self.authors[index]
                            
                            Link(item.0,
                                 destination: URL(string: item.1)!)
                        }
                    }
                    
                    Section(header: Text("Special Thanks")){
                        VStack(alignment: .leading){
                            Text("Leah Li")
                                .font(.title3)
                                .foregroundColor(.accentColor)
                                .padding(.top, 2)
                            Text("APP Icon Designer")
                                .foregroundColor(.secondary)
                                .padding(.bottom, 2)
                        }
                    }
                    
                    Section(header: Text("API Usage")){
                        ForEach(0..<self.apiLinks.count, id: \.self){
                            index in
                            
                            let item = self.apiLinks[index]
                            
                            Link(item.0,
                                 destination: URL(string: item.1)!)
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("About")
        }
        .navigationViewStyle(.stack)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
            .environment(\.locale, .init(identifier: "zh-Hans"))
    }
}
