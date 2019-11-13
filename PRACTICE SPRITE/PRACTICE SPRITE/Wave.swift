//
//  Wave.swift
//  PRACTICE SPRITE
//
//  Created by Ramon Geronimo on 11/10/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import SpriteKit

struct Wave: Codable {
    struct WaveEnemy: Codable {
        let position: Int
        let xOffset: CGFloat
        let moveStraight: Bool
    }
    
    let name: String
    let enemies: [WaveEnemy]
}
