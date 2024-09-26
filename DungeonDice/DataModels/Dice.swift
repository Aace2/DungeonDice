//
//  Dice.swift
//  DungeonDice
//
//  Created by TheForce on 9/26/24.
//

import Foundation



enum Dice: Int, CaseIterable {
    case four = 4
    case six = 6
    case eight = 8
    case ten = 10
    case twelve = 12
    case twenty = 20
    case hundred = 100
    
    func roll() -> Int {
        return Int.random(in: 1...self.rawValue)
    }
}
