//
//  MovementScene.swift
//  WorkShop
//
//  Created by Luciano Uchoa on 02/04/23.
//

import Foundation
import SpriteKit

class MovementAnimationScene: SKScene, UIGestureRecognizerDelegate {
    
    class func newScene() -> MovementAnimationScene {
        let newScene = MovementAnimationScene(size: CGSize(width: 360, height: 480))
        newScene.scaleMode = .aspectFill
        return newScene
    }
    
    var player = PlayerNode()
    var direction : CGFloat = 0
    var velocity: CGFloat = 2
    var longPress = UILongPressGestureRecognizer()
    
    override func didMove(to view: SKView) {
        player.position = CGPoint(x: size.width/2, y: 250)
        self.addChild(player)
        
        setupControls()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if(direction != 0) {
            self.player.xScale = direction
            self.player.position.x += self.direction * velocity
        }
        
        if player.position.x > 384 {
            view?.presentScene(DragginScene.newScene())
        }
    }
    
    func setupControls() {
        longPress.addTarget(self, action: #selector(walk))
        longPress.delegate = self
        longPress.minimumPressDuration = 0.01
        
        view!.addGestureRecognizer(longPress)
    }
    
    @objc func walk(sender: UILongPressGestureRecognizer){
        let touchPosition = sender.location(in: view!)
        
        if sender.state == .ended || sender.state == .cancelled {
            direction = 0
            player.changeAnimation(to: .idle)
            return
        }
        
        if touchPosition.x < self.view!.frame.width/2 {
            direction = -1
            player.changeAnimation(to: .walk)
        } else {
            direction = 1
            player.changeAnimation(to: .walk)
        }
    }
}


