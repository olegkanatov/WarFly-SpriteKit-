//
//  PauseScene.swift
//  WarFly(SpriteKit)
//
//  Created by Oleg Kanatov on 14.10.21.
//

import SpriteKit

class PauseScene: SKScene {
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor(red: 0.15, green: 0.15, blue: 0.3, alpha: 1.0)
        
        let header = ButtonNode(titled: "pause", backgroundName: "header_background")
        header.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 150)
        self.addChild(header)
        
        let titles = ["restart", "options", "resume"]
        
        for (index, title) in titles.enumerated() {
            let button1 = ButtonNode(titled: title, backgroundName: "button_background")
            button1.position = CGPoint(x: self.frame.midX, y: self.frame.midY - CGFloat(100 * index))
            button1.name = title
            button1.label.name = title
            addChild(button1)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "restart" {
            let transition = SKTransition.crossFade(withDuration: 1.0)
            let gameScene = GameScene(size: self.size)
            gameScene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(gameScene, transition: transition)
        }
    }
}
