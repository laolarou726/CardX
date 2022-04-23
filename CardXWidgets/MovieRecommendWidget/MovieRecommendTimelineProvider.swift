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
                    
                    entry.typeAndCountry = "\(randomMovie?!.type ?? "-") | \(firstData?.lang ?? "-")"
                    entry.year = randomMovie?!.year ?? "-"
                    entry.title = firstData?.name ?? "-"
                    entry.time = "\(Int((randomMovie?!.duration ?? 0) / 60)) mins"
                    entry.description = firstData?.description ?? "-"
                    
                    entry.imdbRating = "IMDB \(randomMovie?!.imdbRating ?? "-")"
                    entry.rottenRating = "Rotten \(randomMovie?!.rottenRating ?? "-")%"
                    
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
                            let timeline = Timeline(entries: [entry], policy: .atEnd)
                            completion(timeline)
                        }
                    }
                }
            }
        }
    }
}
