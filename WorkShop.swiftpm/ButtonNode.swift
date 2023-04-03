//
//  ButtonNode.swift
//  WorkShop
//
//  Created by Luciano Uchoa on 02/04/23.
//

import Foundation
import SpriteKit

class ButtonNode: SKSpriteNode {
    let defaultTexture: SKTexture
    let pressedTexture: SKTexture
    let action: () -> Void
    
    init(defaultTexture: String, pressedTexture: String, action: @escaping () -> Void) {
        self.defaultTexture = SKTexture(imageNamed: defaultTexture)
        self.defaultTexture.filteringMode = .nearest
        self.pressedTexture = SKTexture(imageNamed: pressedTexture)
        self.pressedTexture.filteringMode = .nearest
        self.action = action
        
        super.init(texture: self.defaultTexture, color: .clear, size: self.defaultTexture.size())
        
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.run(.setTexture(pressedTexture))
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.run(.setTexture(defaultTexture))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.run(.setTexture(defaultTexture))
        action()
    }
}
