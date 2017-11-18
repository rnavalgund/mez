//
//  Level8.swift
//  Mez
//
//  Created by Rohit Navalgund on 02/11/17.
//  Copyright © 2017 RNavalgund. All rights reserved.
//


import UIKit
import CoreMotion
import SpriteKit
import GameplayKit

class Level8: SKScene, SKPhysicsContactDelegate {
    
    let manager = CMMotionManager()
    let playerNode = SKSpriteNode()
    let endNode = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        playerNode.self.childNode(withName: "playerNode") as? SKSpriteNode
        endNode.self.childNode(withName: "endNode") as? SKSpriteNode
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdates(to: OperationQueue.main) {
            (data, error) in
            self.physicsWorld.gravity = CGVector(dx: (data?.acceleration.x)! * 13, dy: (data?.acceleration.y)! * 13)
            
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        if bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2 ||
            bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1 {
            print("YOU WON!")
            
            //TEST
            
            if let view = self.view {
                // Load the SKScene from 'Level2.sks'
                if let scene = SKScene(fileNamed: "endScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view.presentScene(scene)
                }
                
                view.ignoresSiblingOrder = true
                
                view.showsFPS = true
                view.showsNodeCount = true
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

