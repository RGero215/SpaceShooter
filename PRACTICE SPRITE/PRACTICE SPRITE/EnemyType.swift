//
//  EnemyType.swift
//  PRACTICE SPRITE
//
//  Created by Ramon Geronimo on 11/10/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import SpriteKit

struct EnemyType: Codable {
    let name: String
    let shields: Int
    let speed: CGFloat
    let powerUpChance: Int
}
