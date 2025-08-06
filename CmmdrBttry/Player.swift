//
//  Player.swift
//  CmmdrBttry
//
//  Created by Joseph Gilmore on 5/25/24.
//

import SwiftUICore

struct Player {
    var name: String
    var life: Int
    var startingLife: Int = 40 // Configurable starting life
    var color: Color
    var commanderDamage: [Int] = [0, 0, 0, 0] // Damage from each commander
    var poisonCounters: Int = 0 // Poison counters (lose at 10)
    var energyCounters: Int = 0 // Energy counters
}
