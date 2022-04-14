//
//  TodayInHistoryTimelineProvider.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import Foundation
import Intents
import WidgetKit
import Alamofire

struct TodayInHistoryTimelineProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> TodayInHistoryEntry {
        TodayInHistoryEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (TodayInHistoryEntry) -> ()) {
        let entry = TodayInHistoryEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<TodayInHistoryEntry>) -> ()) {
        AF.request("https://history.muffinlabs.com/date").responseData{
            response in
            
            if(response.error != nil || response.response?.statusCode != 200)
            {
                return
            }
            
            if let res = response.data{
                let str = String(data: res, encoding: .utf8)
                let result = TodayInHistoryModel.deserialize(from: str)
                
                if (result != nil && !(result?.data?.isEmpty ?? true)){
                    let randomData = result?.data?.randomElement()
                    
                    if (randomData?.value.isEmpty ?? false){
                        return
                    }
                    
                    let randomHistory = randomData?.value.randomElement()
                    
                    if (randomHistory == nil){
                        return
                    }
                    
                    var entry = TodayInHistoryEntry(date: Date(), configuration: configuration)
                    
                    entry.type = randomData?.key ?? "-"
                    entry.year = randomHistory!.year
                    entry.history = randomHistory!.text
                    
                    let timeline = Timeline(entries: [entry], policy: .atEnd)
                    completion(timeline)
                }
            }
        }
    }
}
