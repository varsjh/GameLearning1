//
//  myExtensions.swift
//  GameLearning1
//
//  Created by hang jiao on 2019/6/21.
//  Copyright © 2019 hang jiao. All rights reserved.
//

import Foundation
import SpriteKit

extension String {
    subscript(index : Int) -> Character{
        get
        {
            let start = self.startIndex
            return self[self.index(start, offsetBy: index)]
        }
    }
}

extension SKLabelNode {
    func randomize() {
        //随机字母
        let alphabet : String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let x = String(alphabet[Int.random(in: 0...25)])
        self.text = x
        
        //随机颜色
        let randomColor = SKColor(hue: CGFloat(Float.random(in: 0...1.0)), saturation: 0.75, brightness: 1, alpha: CGFloat.random(in: 0...1.0))
        self.fontColor = randomColor
        
        //随机大小
        let randomScale = CGFloat.random(in: 0.60...1.40)
        self.xScale = randomScale
        self.yScale = randomScale
        
        //为字母添加动作
        
        //上升动作
        let floatUp = SKAction.move(by: CGVector(dx:0, dy: 5000), duration: 8)
        
        //摇摆动作
        let rotation1 = SKAction.rotate(byAngle: CGFloat(-Double.pi/3), duration: 0.5)
        let rotation2 = SKAction.rotate(byAngle: CGFloat( Double.pi * 0.67), duration: 1)
        let rotation3 = SKAction.rotate(byAngle: CGFloat(-Double.pi/3), duration: 0.5)
        
        rotation1.timingMode = SKActionTimingMode.easeOut
        rotation2.timingMode = SKActionTimingMode.easeInEaseOut
        rotation3.timingMode = SKActionTimingMode.easeIn
        
        //整合
        let swaggingAction = SKAction.sequence( [ rotation1, rotation2, rotation3 ]        )
        let floatWhileSwagging = SKAction.group([floatUp, SKAction.repeatForever(swaggingAction)])
        self.run(SKAction.sequence([floatWhileSwagging, SKAction.removeFromParent()]))
    }
}
