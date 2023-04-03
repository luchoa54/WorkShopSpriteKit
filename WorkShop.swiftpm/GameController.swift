//
//  File.swift
//  WorkShop
//
//  Created by Luciano Uchoa on 02/04/23.
//

import Foundation

class GameController {
    static var shared: GameController = {
        return GameController()
    }()
    
    var initialScene : MainMenuScene {
        .newScene()
    }
}
