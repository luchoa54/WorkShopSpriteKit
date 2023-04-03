//
//  MainMenuScene.swift
//  WorkShop
//
//  Created by Luciano Uchoa on 02/04/23.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene {
    
    class func newScene() -> MainMenuScene {
        let scene = MainMenuScene(size: CGSize(width: 360, height: 480))
        scene.scaleMode = .aspectFill
        return scene
    }
    
    lazy var playbutton: ButtonNode = {
        let button = ButtonNode(defaultTexture: "PlayButtonDefault", pressedTexture: "PlayButtonPressed"){ [self] in
            view?.presentScene(MovementAnimationScene.newScene())
        }
        
        button.position = CGPoint(x: size.width/2, y: 160)
        
        return button
    }()
    
    lazy var dragbutton: ButtonNode = {
        let button = ButtonNode(defaultTexture: "PlayButtonDefault", pressedTexture: "PlayButtonPressed"){ [self] in
            view?.presentScene(DragginScene.newScene())
        }
        
        button.position = CGPoint(x: size.width/2, y: 100)
        
        return button
    }()
    
    func setupScene(){
        view?.ignoresSiblingOrder = true
        
        addChild(playbutton)
        addChild(dragbutton)
    }
    
    override func didMove(to view: SKView) {
        setupScene()
    }
}
