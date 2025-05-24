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
    var color: Color
    var commanderDamage: [Int] = [0, 0, 0, 0] // Damage from each commander
}
