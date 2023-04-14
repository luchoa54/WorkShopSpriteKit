//
//  ChangingTextureScene.swift
//  WorkShop
//
//  Created by Luciano Uchoa on 13/04/23.
//

import Foundation
import SpriteKit

class ChangingTextureScene: SKScene {
    
    let newTexture = SKTexture(imageNamed: "PlayButtonDefault")
    
    // Definindo o nó que está sendo arrastado
    var nodeBeingDragged: SKNode?
    
    var player = PlayerNode()
    var touchLocation = CGPoint()
    var nodesToChange: [SKNode] = []
    
    class func newScene() -> ChangingTextureScene {
        let newScene = ChangingTextureScene(size: CGSize(width: 360, height: 480))
        newScene.scaleMode = .aspectFill
        return newScene
    }
    
    override func didMove(to view: SKView) {
        player.position = CGPoint(x: size.width/2, y: 250)
        
        let otherNode1 = SKSpriteNode(texture: SKTexture(imageNamed: "pixil-frame-0"),color: .blue, size: CGSize(width: 50, height: 50))
        otherNode1.position = CGPoint(x: frame.midX + 100, y: frame.midY)
        addChild(otherNode1)
        
        let otherNode2 = SKSpriteNode(texture: SKTexture(imageNamed: "pixil-frame-0"),color: .green, size: CGSize(width: 50, height: 50))
        otherNode2.position = CGPoint(x: frame.midX - 100, y: frame.midY)
        addChild(otherNode2)
        
        nodesToChange = [otherNode1, otherNode2]
        
        addChild(player)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            let touchedNodes = nodes(at: touchLocation)
            
            for node in touchedNodes {
                if node == player {
                    player.position = touchLocation
                } else if let spriteNode = node as? SKSpriteNode {
                    if spriteNode == nodeBeingDragged {
                        continue
                    }
                    
                    spriteNode.texture = newTexture
                }
            }
        }
    }
}
