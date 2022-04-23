//
//  RandomDogPhotoTimelineProvider.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/22.
//

import Foundation
import Intents
import WidgetKit
import Alamofire

struct RandomAnimalTimelineProvider: IntentTimelineProvider {
    let dogApi = "https://dog.ceo/api/breeds/image/random"
    let catApi = "https://api.thecatapi.com/v1/images/search"
    
    func placeholder(in context: Context) -> RandomAnimalEntry {
        RandomAnimalEntry(date: Date(), configuration: RandomAnimalSettingsIntent())
    }

    func getSnapshot(for configuration: RandomAnimalSettingsIntent, in context: Context, completion: @escaping (RandomAnimalEntry) -> ()) {
        let entry = RandomAnimalEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: RandomAnimalSettingsIntent, in context: Context, completion: @escaping (Timeline<RandomAnimalEntry>) -> ()) {
        var reqUrl = dogApi
        
        switch(configuration.animalType){
        case .cat:
            reqUrl = catApi
        case .dog:
            reqUrl = dogApi
        default:
            reqUrl = [dogApi, catApi].randomElement()!
        }
        
        AF.request(reqUrl).responseData{
            response in
            
            if(response.error != nil || response.response?.statusCode != 200)
            {
                return
            }
            
            if let res = response.data{
                var str = String(data: res, encoding: .utf8)
                
                switch(configuration.animalType){
                case .cat:
                    str = str?
                        .trimmingCharacters(in: CharacterSet(charactersIn: "["))
                        .trimmingCharacters(in: CharacterSet(charactersIn: "]"))
                default:
                    break
                }
                
                let result = RandomAnimalModel.deserialize(from: str)
                
                if (result != nil){
                    var imgUrl = result?.message
                    
                    switch(configuration.animalType){
                    case .cat:
                        imgUrl = result?.url
                    default:
                        imgUrl = result?.message
                    }
                    
                    AF.request(imgUrl ?? "-").responseData {
                        response in
                        
                        var entry = RandomAnimalEntry(date: Date(), configuration: configuration)
                        
                        if(response.error != nil || response.response?.statusCode != 200)
                        {
                            let timeline = Timeline(entries: [entry], policy: .atEnd)
                            completion(timeline)
                            return
                        }

                        if let res = response.data{
                            entry.image = UIImage(data: res) ?? UIImage(imageLiteralResourceName: "DogImage")
                            let timeline = Timeline(entries: [entry], policy: .atEnd)
                            completion(timeline)
                        }
                    }
                }
            }
        }
    }
}
