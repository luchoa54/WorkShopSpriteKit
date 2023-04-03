//
//  ParticleScene.swift
//  WorkShop
//
//  Created by Luciano Uchoa on 02/04/23.
//

import Foundation
import SpriteKit

class ParticleScene: SKScene {
    
    var particles: SKEmitterNode!
    
    override func didMove(to view: SKView) {
        particles = SKEmitterNode(fileNamed: "rain.sks")!
        particles.position = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
        particles.targetNode = scene
        addChild(particles)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
