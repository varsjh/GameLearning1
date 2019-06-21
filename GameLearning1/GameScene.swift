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
    
    static let interval = 0.1
    static var lastSpawnTime : Date = Date()
    
//    private var label : SKLabelNode?
    private var heart : SKSpriteNode?
    
    
    
//    func spawnALetter(atPosition p : CGPoint ) {
//        if (checkIfIntervalGreater(thanInterval: GameScene.interval)) {
//            if let l = self.label?.copy() as! SKLabelNode? {
//                l.position = p
//                l.randomize()
//                self.addChild(l)
//                GameScene.lastSpawnTime = Date()
//            }
//        }
//    }
    
    func checkIfIntervalGreater( thanInterval i : Double) -> Bool
    {
        let now = Date().timeIntervalSince1970
        let lastTime = GameScene.lastSpawnTime.timeIntervalSince1970
        let delta = now - lastTime
        let ifTrue = delta > i
        return ifTrue
//        return  Date().timeIntervalSince1970 - GameScene.lastSpawnTime.timeIntervalSince1970 > i * 1000.0
    }
    
    func adjustHeartPositionAndAddToParent ( atPosition p : CGPoint ) {
        if (checkIfIntervalGreater(thanInterval: GameScene.interval))
        {
                if let h = self.heart?.copy() as! SKSpriteNode?
                {
                    //随机化参数
                    h.position = p
                    let byScale : CGFloat = CGFloat.random(in: 0.5...1.2) * 0.6
                    h.alpha = CGFloat.random(in: 0.1...1.0)
                    h.setScale(byScale)
                    h.zRotation = CGFloat.random(in: -1...1) * CGFloat.pi / 3
                    
                    //添加动画
                    let zoomIn = SKAction.scale(by: 1.5, duration: 1.5)
                    let floatUp = SKAction.move(by: CGVector(dx: 0, dy: 500), duration: 1.5)
                    let fadeOut = SKAction.fadeOut(withDuration: 1.5)
                    
                    h.run(SKAction.group([zoomIn, floatUp, fadeOut]))
                    
                    //加入父节点
                    self.addChild(h)
                    GameScene.lastSpawnTime = Date()
                }
        }
        
    }
    
    override func didMove(to view: SKView) {
        //创建一个标准的字母label
//        self.label = SKLabelNode(text: "A")
//        if let l = self.label {
//            l.fontSize = 100
//        }
        
        //生成一个心心, 存起来, 后面用
        self.heart = SKSpriteNode(imageNamed: "Heart")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
//            self.spawnALetter(atPosition: t.location(in: self))
            self.adjustHeartPositionAndAddToParent(atPosition: t.location(in: self))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
//            self.spawnALetter(atPosition: t.location(in: self))
            self.adjustHeartPositionAndAddToParent(atPosition: t.location(in: self))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
//            self.spawnALetter(atPosition: t.location(in: self))
            self.adjustHeartPositionAndAddToParent(atPosition: t.location(in: self))
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
