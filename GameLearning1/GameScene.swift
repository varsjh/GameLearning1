//
//  GameScene.swift
//  GameLearning1
//
//  Created by hang jiao on 2019/6/20.
//  Copyright © 2019 hang jiao. All rights reserved.
//

import SpriteKit
import GameplayKit




class GameScene: SKScene {
    
    private var label : SKLabelNode?
    
    func spawnALetter(atPosition p : CGPoint ) {
        if let l = self.label?.copy() as! SKLabelNode? {
            l.position = p
            l.randomize()
            self.addChild(l)
        }
    }
    
    override func didMove(to view: SKView) {
        //创建一个标准的字母label
        self.label = SKLabelNode(text: "A")
        if let l = self.label {
            l.fontSize = 100
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.spawnALetter(atPosition: t.location(in: self))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.spawnALetter(atPosition: t.location(in: self))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.spawnALetter(atPosition: t.location(in: self))
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
