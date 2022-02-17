//
//  RandomWordCardViewModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/2/16.
//

import Foundation
import Alamofire

extension RandomWordCard{
    class RandomWordCardViewModel : ObservableObject{
        @Published private(set) var word: RandomWordModel! = RandomWordModel()
        
        func loadRandomWord(){
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
                        self.word = result![0]
                    }
                }
            }
        }
    }
}
