//
//  RandomPokemonWidgetTimelineProvider.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/29.
//

import Foundation
import Intents
import WidgetKit
import Alamofire

struct RandomPokemonTimelineProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> RandomPokemonEntry {
        RandomPokemonEntry(date: Date(), configuration: PokemonSettingsIntent())
    }

    func getSnapshot(for configuration: PokemonSettingsIntent, in context: Context, completion: @escaping (RandomPokemonEntry) -> ()) {
        let entry = RandomPokemonEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: PokemonSettingsIntent, in context: Context, completion: @escaping (Timeline<RandomPokemonEntry>) -> ()) {
        let offset = Int.random(in: 0...50)
        
        AF.request("https://pokeapi.co/api/v2/pokemon/?offset=\(offset * 20)&limit=20").responseData{
            response in
            
            if(response.error != nil || response.response?.statusCode != 200)
            {
                return
            }
            
            if let res = response.data{
                let linkStr = String(data: res, encoding: .utf8)
                let linkResult = PokemonInfoLinkListModel.deserialize(from: linkStr)
                
                if (linkResult != nil){
                    var entry = RandomPokemonEntry(date: Date(), configuration: configuration)
                    let jsonModel = PokemonJsonModel()
                    let randomLink = linkResult?.results?.randomElement()
                    
                    if(randomLink == nil){
                        return
                    }
                    
                    AF.request(randomLink?.url ?? "-").responseData{
                        response in
                        
                        if(response.error != nil || response.response?.statusCode != 200)
                        {
                            return
                        }
                        
                        if let res = response.data{
                            let str = String(data: res, encoding: .utf8)
                            let result = PokemonInfoModel.deserialize(from: str)
                            
                            if (result != nil){
                                entry.weight = "\(Double(result?.weight ?? 0) / 10) kg"
                                jsonModel.weight = entry.weight
                                
                                entry.height = "\(Double(result?.height ?? 0) / 10) m"
                                jsonModel.height  = entry.height
                                
                                var types: [String] = []
                                for type in (result?.types ?? []){
                                    if let typeStr = type.type?.name{
                                        types.append(typeStr)
                                    }
                                }
                                
                                entry.types = types
                                jsonModel.types = entry.types
                                
                                var stats: [StatModel] = []
                                for stat in (result?.stats ?? []){
                                    if let statName = stat.stat?.name{
                                        let sm = StatModel()
                                        sm.key = statName
                                        sm.value = stat.base_stat ?? 0
                                        
                                        stats.append(sm)
                                    }
                                }
                                
                                entry.stats = stats
                                jsonModel.stats = entry.stats
                                
                                AF.request("https://pokeapi.co/api/v2/pokemon-species/\(result?.id ?? -1)/").responseData{
                                    response in
                                    
                                    if(response.error != nil || response.response?.statusCode != 200)
                                    {
                                        return
                                    }
                                    
                                    if let res = response.data{
                                        let str = String(data: res, encoding: .utf8)
                                        let result = PokemonSpeciesModel.deserialize(from: str)
                                        
                                        var language = "en"
                                        switch(configuration.language){
                                        case .english:
                                            language = "en"
                                        case .french:
                                            language = "fr"
                                        case .german:
                                            language = "de"
                                        case .japanese:
                                            language = "ja"
                                        case .japanese_kana:
                                            language = "ja-Hrkt"
                                        case .korean:
                                            language = "ko"
                                        case .roomaji:
                                            language = "roomaji"
                                        case .simplified_Chinese:
                                            language = "zh-Hans"
                                        case .traditional_Chinese:
                                            language = "zh-Hant"
                                        case .spanish:
                                            language = "es"
                                        default:
                                            language = "en"
                                        }
                                        
                                        let color = result?.color?.name ?? "yellow"
                                        let localName = result?.names?.first(where: {$0.language?.name == language})?.name ?? result?.name ?? "-"
                                        
                                        entry.backgroundColor = ColorHelper.getColor(color)
                                        jsonModel.backgroundColor = color
                                        
                                        entry.name = localName
                                        jsonModel.name = entry.name
                                        jsonModel.imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(result?.id ?? 0).png"
                                        
                                        entry.jsonStr = jsonModel.toJSONString()?.toBase64()
                                        
                                        AF.request(jsonModel.imageUrl).responseData {
                                            response in
                                            if(response.error != nil || response.response?.statusCode != 200)
                                            {
                                                let timeline = Timeline(entries: [entry], policy: .atEnd)
                                                completion(timeline)
                                                return
                                            }

                                            if let res = response.data{
                                                entry.image = UIImage(data: res) ?? UIImage(imageLiteralResourceName: "Pokemon")
                                                let timeline = Timeline(entries: [entry], policy: .atEnd)
                                                completion(timeline)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
