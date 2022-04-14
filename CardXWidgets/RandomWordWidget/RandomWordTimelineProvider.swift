//
//  RandomWordTimelineProvider.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/3/31.
//

import Foundation
import Intents
import WidgetKit
import Alamofire

struct RandomWordTimelineProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> RandomWordEntry {
        RandomWordEntry(date: Date(), word: RandomWordModel(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (RandomWordEntry) -> ()) {
        let entry = RandomWordEntry(date: Date(), word: RandomWordModel(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<RandomWordEntry>) -> ()) {
        AF.request("https://random-words-api.vercel.app/word").responseData{
            response in
            
            if(response.error != nil || response.response?.statusCode != 200)
            {
                return
            }
            
            if let res = response.data{
                let str = String(data: res, encoding: .utf8)
                let result = [RandomWordModel].deserialize(from: str)
                if (result != nil && !(result?.isEmpty ?? true)){
                    let entries = [
                        RandomWordEntry(date: Date(), word: result![0]!, configuration: configuration)
                    ]

                    let timeline = Timeline(entries: entries, policy: .atEnd)
                    completion(timeline)
                }
            }
        }
    }
}
