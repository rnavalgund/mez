//
//  Level3.swift
//  Mez
//
//  Created by Rohit Navalgund on 28/10/17.
//  Copyright © 2017 RNavalgund. All rights reserved.
//

import UIKit
import CoreMotion
import SpriteKit
import GameplayKit

class endScene: SKScene, SKPhysicsContactDelegate {
    
    let manager = CMMotionManager()
    let lbl = SKLabelNode()
    
       override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        lbl.self.childNode(withName: "lbl") as? SKLabelNode
        self.addChild(self.lbl)
            
            
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
