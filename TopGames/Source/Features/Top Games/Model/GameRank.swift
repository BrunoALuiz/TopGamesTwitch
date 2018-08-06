//
//  GameRank.swift
//  TopGames
//
//  Created by Bruno Luiz on 03/08/18.
//  Copyright © 2018 Bruno Luiz. All rights reserved.
//

import Foundation
import ObjectMapper

class GameRank: Mappable {
    
    //**************************************************
    // MARK: - Properties
    //**************************************************
    
    public var game: Game?
    public var viewers: Int?
    public var channels: Int?
    public var isNew: Bool = true
    
    //**************************************************
    // MARK: - Initializers
    //**************************************************
    
    public required init() { }
    public required init?(map: Map) { }
    
    //**************************************************
    // MARK: - Exposed Methods
    //**************************************************
    
    public func mapping(map: Map) {
        self.game     <- map["game"]
        self.viewers  <- map["viewers"]
        self.channels <- map["channels"]
    }
}

//**************************************************
// MARK: - Equatable
//**************************************************

extension GameRank: Equatable {
    
    public static func ==(lhs: GameRank, rhs: GameRank) -> Bool {
        return lhs.game?.id == rhs.game?.id
    }
}
