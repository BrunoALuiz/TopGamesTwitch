//
//  Game.swift
//  TopGames
//
//  Created by Bruno Luiz on 23/07/18.
//  Copyright © 2018 Bruno Luiz. All rights reserved.
//

import Foundation
import ObjectMapper

public class Game: Mappable {
    
    //**************************************************
    // MARK: - Properties
    //**************************************************
    
    public var id: Int?
    public var name: String?
    public var url: String?
    public var popularity: Int?
    
    //**************************************************
    // MARK: - Initializers
    //**************************************************

    public init() { }
    public required init?(map: Map) { }
    
    //**************************************************
    // MARK: - Public Methods
    //**************************************************
    
    public func mapping(map: Map) {
        self.id         <- map["id"]
        self.name       <- map["name"]
        self.url        <- map["url"]
        self.popularity <- map["popularity"]
    }
}
