//
//  MovieRecommendTimelineProvider.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import Foundation
import Intents
import WidgetKit
import Alamofire

struct MovieRecommendTimelineProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> MovieRecommendEntry {
        MovieRecommendEntry(date: Date(), configuration: MovieRecommandSettingsIntent())
    }

    func getSnapshot(for configuration: MovieRecommandSettingsIntent, in context: Context, completion: @escaping (MovieRecommendEntry) -> ()) {
        let entry = MovieRecommendEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: MovieRecommandSettingsIntent, in context: Context, completion: @escaping (Timeline<MovieRecommendEntry>) -> ()) {
        var lang = "En"
        
        switch(configuration.language){
        case .cn:
            lang = "Cn"
        default:
            lang = "En"
        }
        
        AF.request("https://api.wmdb.tv/api/v1/top?type=Imdb&skip=0&limit=50&lang=\(lang)").responseData{
            response in
            
            if(response.error != nil || response.response?.statusCode != 200)
            {
                return
            }
            
            if let res = response.data{
                let str = String(data: res, encoding: .utf8)
                let result = [MovieModel].deserialize(from: str)
                let randomMovie = result?.randomElement()
                
                if (randomMovie != nil && !(randomMovie?!.data?.isEmpty ?? false)){
                    let firstData = randomMovie!?.data![0]
                    var entry = MovieRecommendEntry(date: Date(), configuration: configuration)
                    let jsonModel = MovieJsonModel()
                    
                    entry.typeAndCountry = "\(randomMovie?!.type ?? "-") | \(firstData?.lang ?? "-")"
                    jsonModel.typeAndCountry  = entry.typeAndCountry
                    
                    entry.year = randomMovie?!.year ?? "-"
                    jsonModel.year = entry.year
                    
                    entry.title = firstData?.name ?? "-"
                    jsonModel.title = entry.title
                    
                    entry.time = "\(Int((randomMovie?!.duration ?? 0) / 60)) mins"
                    jsonModel.time = entry.time
                    
                    entry.description = firstData?.description ?? "-"
                    jsonModel.description = entry.description
                    
                    entry.imdbRating = "IMDB \(randomMovie?!.imdbRating ?? "-")"
                    jsonModel.imdbRating = entry.imdbRating
                    
                    entry.rottenRating = "Rotten \(randomMovie?!.rottenRating ?? "-")%"
                    jsonModel.rottenRating = entry.rottenRating
                    
                    jsonModel.imgUrl = firstData?.poster
                    
                    AF.request(firstData?.poster ?? "").responseData {
                        response in
                        
                        if(response.error != nil || response.response?.statusCode != 200)
                        {
                            let timeline = Timeline(entries: [entry], policy: .atEnd)
                            completion(timeline)
                            return
                        }

                        if let res = response.data{
                            entry.movieImg = UIImage(data: res) ?? UIImage(imageLiteralResourceName: "Default_IMDB_Image")
                            entry.jsonStr = jsonModel.toJSONString()?.toBase64()
                            
                            let timeline = Timeline(entries: [entry], policy: .atEnd)
                            completion(timeline)
                        }
                    }
                }
            }
        }
    }
}
