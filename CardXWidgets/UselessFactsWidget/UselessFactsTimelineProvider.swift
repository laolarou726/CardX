//
//  UselessFactsTimelineProvider.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import Foundation
import Intents
import WidgetKit
import Alamofire

struct UselessFactsTimelineProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> UselessFactsEntry {
        UselessFactsEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (UselessFactsEntry) -> ()) {
        let entry = UselessFactsEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<UselessFactsEntry>) -> ()) {
        AF.request("https://uselessfacts.jsph.pl/random.json?language=en").responseData{
            response in
            
            if(response.error != nil || response.response?.statusCode != 200)
            {
                return
            }
            
            if let res = response.data{
                let str = String(data: res, encoding: .utf8)
                let result = UselessFactsModel.deserialize(from: str)
                if (result != nil){
                    let jsonModel = UselessFactsJsonModel()
                    var entry = UselessFactsEntry(date: Date(), configuration: configuration)
                    
                    entry.facts = result?.text ?? "The facts is there is no any facts."
                    jsonModel.facts = entry.facts
                    
                    entry.jsonStr = jsonModel.toJSONString()?.toBase64()

                    let timeline = Timeline(entries: [entry], policy: .atEnd)
                    completion(timeline)
                }
            }
        }
    }
}
