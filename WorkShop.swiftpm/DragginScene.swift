//
//  DragginScene.swift
//  WorkShop
//
//  Created by Luciano Uchoa on 02/04/23.
//

import Foundation
import SpriteKit

class DragginScene: SKScene {
    
    var player = PlayerNode()
    var touchLocation = CGPoint()
    var particles: SKEmitterNode!
    
    class func newScene() -> DragginScene {
        let newScene = DragginScene(size: CGSize(width: 360, height: 480))
        newScene.scaleMode = .aspectFill
        return newScene
    }
    
    override func didMove(to view: SKView) {
        player.position = CGPoint(x: size.width/2, y: 250)
        particles = SKEmitterNode(fileNamed: "rain.sks")!
        particles.position = CGPoint(x: size.width/2, y: 450)
        particles.targetNode = scene
        addChild(particles)
        self.addChild(player)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            touchLocation = touch.location(in: self)

            player.position.x = (touchLocation.x)
            player.position.y = (touchLocation.y)
        }
    }
}
