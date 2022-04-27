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
        TodayInHistoryEntry(date: Date(), configuration: TodayInHistorySettingsIntent())
    }

    func getSnapshot(for configuration: TodayInHistorySettingsIntent, in context: Context, completion: @escaping (TodayInHistoryEntry) -> ()) {
        let entry = TodayInHistoryEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: TodayInHistorySettingsIntent, in context: Context, completion: @escaping (Timeline<TodayInHistoryEntry>) -> ()) {
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
                    let re = result?.data?.randomElement()
                    var randomDataKey = re?.key
                    var randomDataValue = re?.value
                    
                    switch(configuration.historyType){
                    case .event:
                        randomDataKey = "Events"
                        randomDataValue = result?.data?["Events"]
                    case .birth:
                        randomDataKey = "Births"
                        randomDataValue = result?.data?["Births"]
                    case .death:
                        randomDataKey = "Deaths"
                        randomDataValue = result?.data?["Deaths"]
                    default:
                        let ree = result?.data?.randomElement()
                        randomDataKey = ree?.key
                        randomDataValue =  ree?.value
                    }
                    
                    if (randomDataValue?.isEmpty ?? false){
                        return
                    }
                    
                    let randomHistory = randomDataValue?.randomElement()
                    
                    if (randomHistory == nil){
                        return
                    }
                    
                    let jsonModel = TodayInHistoryJsonModel()
                    var entry = TodayInHistoryEntry(date: Date(), configuration: configuration)
                    
                    entry.type = randomDataKey ?? "-"
                    jsonModel.type = entry.type
                    
                    entry.year = randomHistory!.year
                    jsonModel.year = entry.year
                    
                    entry.history = randomHistory!.text
                    jsonModel.history = entry.history
                    
                    entry.jsonStr = jsonModel.toJSONString()?.toBase64()
                    
                    let timeline = Timeline(entries: [entry], policy: .atEnd)
                    completion(timeline)
                }
            }
        }
    }
}
