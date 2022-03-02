//
//  RandomQuoteCardViewModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/3/1.
//

import Foundation
import Alamofire

extension RandomQuoteCard{
    class RandomQuoteCardViewModel : ObservableObject{
        @Published private(set) var quote: RandomQuoteModel! = RandomQuoteModel()
        
        func loadRandomQuote(){
            AF.request("https://quotes.rest/qod?language=en").responseData{
                response in
                
                if(response.error != nil || response.response?.statusCode != 200)
                {
                    return
                }
                
                if let res = response.data{
                    let str = String(data: res, encoding: .utf8)
                    let result = RandomQuoteModel.deserialize(from: str)
                    if (result != nil){
                        self.quote = result
                    }
                }
            }
        }
    }
}
