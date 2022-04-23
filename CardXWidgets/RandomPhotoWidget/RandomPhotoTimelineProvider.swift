//
//  RandomPhotoTimelineProvider.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/14.
//

import Foundation
import Intents
import WidgetKit
import Alamofire

struct RandomPhotoTimelineProvider: IntentTimelineProvider {
    let clientId = "fe1c22ded50ede0397b7eb80b44e7f27289c95c2b57d964a11e55a57ee3fc571"
    
    func placeholder(in context: Context) -> RandomPhotoEntry {
        RandomPhotoEntry(date: Date(), configuration: RandomPhotoSettingsIntent())
    }

    func getSnapshot(for configuration: RandomPhotoSettingsIntent, in context: Context, completion: @escaping (RandomPhotoEntry) -> ()) {
        let entry = RandomPhotoEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: RandomPhotoSettingsIntent, in context: Context, completion: @escaping (Timeline<RandomPhotoEntry>) -> ()) {
        let contentFilter = (configuration.contentFilter?.boolValue ?? false) ? "&content_filter=high" : ""
        var orientation = ""
        
        switch(configuration.imageOrientation){
        case .landscape:
            orientation = "&orientation=landscape"
        case .portrait:
            orientation = "&orientation=portrait"
        case .squarish:
            orientation = "&orientation=squarish"
        default:
            orientation = ""
        }
        
        AF.request("https://api.unsplash.com/photos/random?client_id=\(clientId)\(contentFilter)\(orientation)").responseData{
            response in
            
            if(response.error != nil || response.response?.statusCode != 200)
            {
                return
            }
            
            if let res = response.data{
                let str = String(data: res, encoding: .utf8)
                let result = RandomPhotoModel.deserialize(from: str)
                
                if (result != nil){
                    var entry = RandomPhotoEntry(date: Date(), configuration: configuration)
                    
                    entry.color = result?.color ?? "#000"
                    entry.exifName = result?.exif?.name ?? "UNKNOWN"
                    
                    AF.request(result?.urls?["regular"] ?? result?.urls?["raw"] ?? "-").responseData {
                        response in
                        
                        if(response.error != nil || response.response?.statusCode != 200)
                        {
                            let timeline = Timeline(entries: [entry], policy: .atEnd)
                            completion(timeline)
                            return
                        }

                        if let res = response.data{
                            entry.image = UIImage(data: res) ?? UIImage(imageLiteralResourceName: "Image")
                            let timeline = Timeline(entries: [entry], policy: .atEnd)
                            completion(timeline)
                        }
                    }
                }
            }
        }
    }
}
