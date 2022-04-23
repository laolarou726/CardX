//
//  RandomMusicTimelineProvider.swift
//  CardXWidgetsExtension
//
//  Created by 罗麟瑞 on 2022/4/14.
//

import Foundation
import Intents
import WidgetKit
import Alamofire

struct RandomMusicTimelineProvider: IntentTimelineProvider {
    let cnPlaylistId = [
        "3779629",
        "19723756",
        "2884035",
        "3778678",
        "5453912201",
        "991319590",
        "71384707",
        "1978921795",
        "3112516681",
        "21845217"
    ]
    let enPlaylistId = [
        "60198",
        "3812895",
        "180106",
        "2809513713"
    ]
    let limit = "10"
    let cookie = "MUSIC_R_T=1466682498803; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/api/feedback;;MUSIC_A_T=1466682473948; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/neapi/clientlog;;MUSIC_A_T=1466682473948; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/wapi/feedback;;MUSIC_A_T=1466682473948; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/weapi/feedback;;MUSIC_A_T=1466682473948; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/openapi/clientlog;;MUSIC_R_T=1466682498803; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/weapi/clientlog;;MUSIC_A_T=1466682473948; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/eapi/feedback;;MUSIC_R_T=1466682498803; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/eapi/feedback;;MUSIC_A_T=1466682473948; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/api/clientlog;;NMTID=00OE5Viu1vXMZcoRULUh3s13DofU8YAAAGAKSC1tA; Max-Age=315360000; Expires=Sun, 11 Apr 2032 17:30:51 GMT; Path=/;;MUSIC_R_T=1466682498803; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/wapi/feedback;;MUSIC_R_T=1466682498803; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/neapi/clientlog;;MUSIC_R_T=1466682498803; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/eapi/clientlog;;MUSIC_R_T=1466682498803; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/neapi/feedback;;MUSIC_R_T=1466682498803; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/wapi/clientlog;;MUSIC_A_T=1466682473948; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/neapi/feedback;;MUSIC_SNS=; Max-Age=0; Expires=Thu, 14 Apr 2022 17:30:51 GMT; Path=/;MUSIC_A_T=1466682473948; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/eapi/clientlog;;MUSIC_U=8110cde918e00e166cffb8b972cdbb8a4ba2a162576a5131c707b042888ffd5d993166e004087dd3f16fab37d91d07c4e9d8bd2e1610470984a51920b9402ad9a143c698b60ed9dfa89fe7c55eac81f3; Max-Age=1296000; Expires=Fri, 29 Apr 2022 17:30:51 GMT; Path=/;;__csrf=1ad0b8d472a499052c9e7f288d0624d6; Max-Age=1296010; Expires=Fri, 29 Apr 2022 17:31:01 GMT; Path=/;;MUSIC_R_T=1466682498803; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/openapi/clientlog;;MUSIC_A_T=1466682473948; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/api/feedback;;MUSIC_R_T=1466682498803; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/api/clientlog;;MUSIC_A_T=1466682473948; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/weapi/clientlog;;MUSIC_R_T=1466682498803; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/weapi/feedback;;MUSIC_A_T=1466682473948; Max-Age=2147483647; Expires=Tue, 2 May 2090 20:44:58 GMT; Path=/wapi/clientlog;;__remember_me=true; Max-Age=1296000; Expires=Fri, 29 Apr 2022 17:30:51 GMT; Path=/;"
    
    func placeholder(in context: Context) -> RandomMusicEntry {
        RandomMusicEntry(date: Date(), configuration: RandomMusicSettingsIntent())
    }

    func getSnapshot(for configuration: RandomMusicSettingsIntent, in context: Context, completion: @escaping (RandomMusicEntry) -> ()) {
        let entry = RandomMusicEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: RandomMusicSettingsIntent, in context: Context, completion: @escaping (Timeline<RandomMusicEntry>) -> ()) {
        var id = "60198"
        
        switch(configuration.language){
        case .cn:
            id = cnPlaylistId.randomElement()!
        default:
            id = enPlaylistId.randomElement()!
        }
        
        AF.request("https://netease-cloud-music-api-sigma-taupe.vercel.app/playlist/track/all?id=\(id)&limit=\(limit)&offset=1&cookie=\(cookie.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)").responseData{
            response in
            
            if(response.error != nil || response.response?.statusCode != 200)
            {
                return
            }
            
            if let res = response.data{
                let str = String(data: res, encoding: .utf8)
                let result = RandomMusicModel.deserialize(from: str)
                
                if (result != nil && !(result?.songs?.isEmpty ?? true)){
                    var entry = RandomMusicEntry(date: Date(), configuration: configuration)
                    let randomMusic = result?.songs?.randomElement()
                    
                    if (randomMusic == nil){
                        return
                    }
                    
                    if(randomMusic?.al == nil){
                        return
                    }
                    
                    entry.name = randomMusic?.name ?? "-"
                    entry.mark = "Mark \(randomMusic?.mark ?? 0)"
                    entry.pop = "Popularity \(randomMusic?.pop ?? 0)"
                    entry.author = randomMusic?.ar?[0].name ?? "-"
                    
                    AF.request(randomMusic?.al?.picUrl ?? "-").responseData {
                        response in
                        
                        if(response.error != nil || response.response?.statusCode != 200)
                        {
                            let timeline = Timeline(entries: [entry], policy: .atEnd)
                            completion(timeline)
                            return
                        }

                        if let res = response.data{
                            entry.imgData = UIImage(data: res) ?? UIImage(imageLiteralResourceName: "Default_Cover")
                            let timeline = Timeline(entries: [entry], policy: .atEnd)
                            completion(timeline)
                        }
                    }
                }
            }
        }
    }
}
