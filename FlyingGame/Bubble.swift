//
//  Bubble.swift
//  FlyingGame
//
//  Created by mitchell hudson on 4/27/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import SpriteKit

class Bubble: SKSpriteNode {
    init() {
        
        let size = CGSize(width: 60, height: 60)
        super.init(texture: nil, color: UIColor.red, size: size)
        
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.categoryBitMask = PhysicsCategories.bubble
        physicsBody?.collisionBitMask = PhysicsCategories.bounds | PhysicsCategories.bubble
        physicsBody?.angularDamping = 0.75
        
        name = "bubble"
        
        // physicsBody?.affectedByGravity = false
        
        // contact categories bitmasks
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}
