//
//  IntegrationView.swift
//  WorkShop
//
//  Created by Luciano Uchoa on 02/04/23.
//

import Foundation
import SpriteKit
import Combine
import SwiftUI

struct IntegrationView: View {
    
    let door = GameScene.shared
    
    var scene: SKScene {
        let scene = GameScene.shared
        scene.size = CGSize(width: 256, height: 256)
        scene.scaleMode = .fill
        scene.backgroundColor = .white
        return scene
    }
    
    var body: some View {
        
        SpriteView(scene: scene)
            .frame(width: 256, height: 256)
            .ignoresSafeArea()
        Button {
            door.running += 1
        } label: {
            Text("jump")
        }
    }
}

class GameScene: SKScene {
    static var shared = GameScene()
    
    var marker:SKSpriteNode!
    var running = 0 {
        didSet { self.jump() }
      }
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        let texture = SKTexture(imageNamed: "pixil-frame-0")
        marker = SKSpriteNode(texture: texture)
        marker.texture?.filteringMode = .nearest
        marker.size = CGSize(width: 300, height: 300)
        marker.position = CGPoint(x: 128, y: 118)
        marker.physicsBody = SKPhysicsBody(circleOfRadius: 32)
        scene?.addChild(marker)
        
    }
    
    public func jump() {
        let foo = SKAction.applyImpulse(CGVector(dx: 0, dy: 128), duration: 0.5)
        marker.run(foo)
    }
    
}
