//
//  RandomQuoteTimelineProvider.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/3/31.
//

import Foundation
import Intents
import WidgetKit
import Alamofire

struct RandomQuoteTimelineProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> RandomQuoteEntry {
        RandomQuoteEntry(date: Date(), quote: RandomQuoteModel(), imgData: UIImage(imageLiteralResourceName: "Image"), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (RandomQuoteEntry) -> ()) {
        let entry = RandomQuoteEntry(date: Date(), quote: RandomQuoteModel(), imgData: UIImage(imageLiteralResourceName: "Image"), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<RandomQuoteEntry>) -> ()) {
        AF.request("https://quotes.rest/qod?language=en").responseData{
            response in
            
            if(response.error != nil || response.response?.statusCode != 200)
            {
                return
            }
            
            if let res = response.data{
                let str = String(data: res, encoding: .utf8)
                let result = RandomQuoteModel.deserialize(from: str)
                
                if (result != nil){
                    var entry = RandomQuoteEntry(date: Date(), quote: result!, imgData: UIImage(imageLiteralResourceName: "Image"), configuration: configuration)
                    let imgUrl = result?.contents?.quotes?[0].background
                    
                    if(imgUrl == nil){
                        let timeline = Timeline(entries: [entry], policy: .atEnd)
                        completion(timeline)
                        return
                    }
                    
                    AF.request(imgUrl!).responseData {
                        response in
                        
                        if(response.error != nil || response.response?.statusCode != 200)
                        {
                            let timeline = Timeline(entries: [entry], policy: .atEnd)
                            completion(timeline)
                            return
                        }

                        if let res = response.data{
                            entry.imgData = UIImage(data: res) ?? UIImage(imageLiteralResourceName: "image")
                            let timeline = Timeline(entries: [entry], policy: .atEnd)
                            completion(timeline)
                        }
                    }
                }
            }
        }
    }
}
