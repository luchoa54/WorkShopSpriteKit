//
//  PlayerNode.swift
//  WorkShop
//
//  Created by Luciano Uchoa on 02/04/23.
//

import Foundation
import SpriteKit

public enum PlayerAnimationState {
    case idle, walk
}

class PlayerNode: SKNode {
    
    let sprite: SKSpriteNode
    var direction = 0
    var maxSpeed: CGFloat = 200
    
    override init() {
        self.sprite = SKSpriteNode(imageNamed: "pixil-frame-0")
        self.sprite.texture?.filteringMode = .nearest
        self.sprite.size = CGSize(width: 100, height: 100)
        super.init()
        
        self.addChild(sprite)
        changeAnimation(to: .idle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupBody(){
        let body = SKPhysicsBody(rectangleOf: sprite.size)
        body.restitution = 0
        body.mass = 0.1
        body.linearDamping = 3
        body.allowsRotation = false
        body.categoryBitMask = 1 << 0
        body.collisionBitMask = 1 << 0
        body.contactTestBitMask = 1 << 1
        sprite.physicsBody = body
    }
    
    public func changeAnimation(to state: PlayerAnimationState) {
        switch state {
        case .idle:
            sprite.run(.repeatForever(.animate(with: .init(withFormat: "pixil-frame-%@", range: 0...0), timePerFrame: 0.1)))
        case .walk:
            sprite.run(.repeatForever(.animate(with: .init(withFormat: "pixil-frame-%@", range: 0...4), timePerFrame: 0.1)))
        }
    }
    
}
