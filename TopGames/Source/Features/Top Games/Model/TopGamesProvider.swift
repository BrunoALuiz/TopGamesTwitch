//
//  TopGamesProvider.swift
//  TopGames
//
//  Created by Bruno Luiz on 23/07/18.
//  Copyright © 2018 Bruno Luiz. All rights reserved.
//

import Foundation
import SwiftyJSON

class TopGamesProvider: NSObject {
    
    static func getAll(fromOffSet offSet: Int, completion: @escaping (_ result: [GameRank], _ isSuccess: Bool, _ error: NetworkResponse.Error?) -> Void) {
        
        NetworkService.Game.top(with: 20, from: offSet).execute { (json, response) in
            
            switch response {
            case .success:
                var gamesRank: [GameRank] = []
                
                json["top"].array?.forEach({ (json) in
                    
                    if let gameRank = GameRank(JSON: json.dictionaryObject ?? [:]) {
                        gamesRank.append(gameRank)
                    }
                })
                
                completion(gamesRank, true, nil)
            case let .error(error):
                completion([], false, error)
            }
        }
    }
}
