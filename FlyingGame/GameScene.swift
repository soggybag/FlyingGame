//
//  GameScene.swift
//  FlyingGame
//
//  Created by mitchell hudson on 4/27/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var bubbleCount = 3
    var bubbles = [Bubble]()
    var isDown = false
    
    
    override init(size: CGSize) {
        
        for i in 0 ..< bubbleCount {
            bubbles.append(Bubble())
        }
        
        super.init(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPhysics() {
        let rect = view!.frame.insetBy(dx: 10, dy: 10)
        physicsBody = SKPhysicsBody(edgeLoopFrom: rect)
        physicsBody?.categoryBitMask = PhysicsCategories.bounds
        physicsBody?.collisionBitMask = PhysicsCategories.bubble
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -3)
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        let w = view.bounds.width
        let h = view.bounds.height
        var i: CGFloat = 1
        for bubble in bubbles {
            addChild(bubble)
            let x = CGFloat(arc4random() % UInt32(w - 80)) + 40
            let y = h - 60 * i
            bubble.position.x = x
            bubble.position.y = y
            i += 1
        }
        
        setupPhysics()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch!.location(in: self)
        let node = atPoint(location)
        if node.name == "bubble" {
            let x = node.position.x - location.x
            let bump = CGVector(dx: x, dy: 30)
            node.physicsBody?.applyImpulse(bump)
            node.physicsBody?.applyImpulse(bump, at: location)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
