//
//  Player.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/25/24.
//

import Foundation
import SwiftData

@Model
final class Player {
    var name: String
    var health: Int
    var commanderDamage: Int = 0
    var color: String
    
    init(name: String, health: Int, color: String) {
        self.name = name
        self.health = health
        self.color = color
    }
    
    static func testExample() -> Player {
        return Player(name: "Joseph", health: 40, color: "Red")
    }
}
