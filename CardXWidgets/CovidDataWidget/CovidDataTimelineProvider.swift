//
//  CovidDataTimelineProvider.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/14.
//

import Foundation
import Intents
import WidgetKit
import Alamofire

struct CovidDataTimelineProvider: IntentTimelineProvider {
    let apiKey = "7f5d3259f9ea46d7a7b7d7958f3ff2b3"
    
    func placeholder(in context: Context) -> CovidDataEntry {
        CovidDataEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (CovidDataEntry) -> ()) {
        let entry = CovidDataEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<CovidDataEntry>) -> ()) {
        AF.request("https://api.covidactnow.org/v2/counties.json?apiKey=\(apiKey)").responseData{
            response in
            
            if(response.error != nil || response.response?.statusCode != 200)
            {
                return
            }
            
            if let res = response.data{
                let str = String(data: res, encoding: .utf8)
                let result = [CovidDataModel].deserialize(from: str)
                
                if (result != nil && !(result?.isEmpty ?? true)){
                    var totalDeath = 0
                    var totalComfirm = 0
                    var totalHealth = 0
                    
                    for data in result!{
                        totalDeath += data?.actuals?.deaths ?? 0
                        totalComfirm += data?.actuals?.cases ?? 0
                        totalHealth += (data?.population ?? 0) - (data?.actuals?.deaths ?? 0 + data?.actuals?.cases ?? 0)
                    }
                    
                    var entry = CovidDataEntry(date: Date(), configuration: configuration)
                    
                    entry.values = [
                        (totalDeath, .secondary, "Death"),
                        (totalComfirm, Color(hex: "#ef5350"), "Comfirm"),
                        (totalHealth, Color(hex: "#536dfe"), "Health")
                    ]
                    
                    let timeline = Timeline(entries: [entry], policy: .atEnd)
                    completion(timeline)
                }
            }
        }
    }
}
