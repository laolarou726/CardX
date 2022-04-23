//
//  WeatherTimelineProvider.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/13.
//

import Foundation
import Intents
import WidgetKit
import Alamofire

struct WeatherTimelineProvider: IntentTimelineProvider {
    fileprivate let API_KEY = "fcfc88146a5fd0a390552926e2ea6f24"
    fileprivate var widgetLocationManager = WidgetLocationManager()
    
    fileprivate var lastLat: Double = 0
    fileprivate var lastLon: Double = 0
    
    func placeholder(in context: Context) -> WeatherEntry {
        WeatherEntry(date: Date(), configuration: WeatherSettingsIntent())
    }

    func getSnapshot(for configuration: WeatherSettingsIntent, in context: Context, completion: @escaping (WeatherEntry) -> ()) {
        let entry = WeatherEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: WeatherSettingsIntent, in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> ()) {
        widgetLocationManager.fetchLocation(handler: { location in
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            var lang = ""
            
            switch(configuration.language){
            case .cn:
                lang = "&lang=zh_cn"
            case .en:
                lang = "&lang=en"
            default:
                lang = ""
            }
            
            let reqUrl = "https://api.openweathermap.org/data/2.5/weather?lat=\(Int(lat))&lon=\(Int(lon))\(lang)&units=metric&appid=\(API_KEY)"
            
            var resultEntry = WeatherEntry(date: Date(), configuration: configuration)
            
            AF.request(reqUrl).responseData{
                response in
                
                if(response.error != nil || response.response?.statusCode != 200)
                {
                    return
                }
                
                if let res = response.data{
                    let str = String(data: res, encoding: .utf8)
                    let result = WeatherResponseModel.deserialize(from: str)
                    if (result != nil){
                        resultEntry.location = result!.name ?? "UNKNOWN LOCATION"
                        
                        var icon = "";
                        if let weather = result!.weather?[0]{
                            resultEntry.weather = weather.main ?? "-"
                            resultEntry.weatherDescription = weather.description ?? "-"
                            resultEntry.weatherType = WeatherHelper.getWeatherType(type: weather.main)
                            
                            if let iconId = weather.icon{
                                icon = iconId;
                            }
                        }
                        
                        if let main = result!.main{
                            resultEntry.feelLikeTemp = main.feels_like ?? 0
                            resultEntry.minTemp = main.temp_min ?? 0
                            resultEntry.maxTemp = main.temp_max ?? 0
                            resultEntry.humidity = main.humidity ?? 0
                        }
                        
                        if let wind = result!.wind{
                            resultEntry.windSpeed = wind.speed ?? 0
                        }
                        
                        if icon != ""{
                            AF.request("https://openweathermap.org/img/wn/\(icon)@2x.png").responseData {
                                response in
                                
                                if(response.error != nil || response.response?.statusCode != 200)
                                {
                                    let timeline = Timeline(entries: [resultEntry], policy: .atEnd)
                                    completion(timeline)
                                    return
                                }

                                if let res = response.data{
                                    resultEntry.weatherImg = UIImage(data: res) ?? UIImage(imageLiteralResourceName: "Default_Weather_Icon")
                                    let timeline = Timeline(entries: [resultEntry], policy: .atEnd)
                                    completion(timeline)
                                }
                            }
                        }
                    }
                }
            }
        })
    }
}
