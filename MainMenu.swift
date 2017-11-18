//
//  MainMenu.swift
//  Mez
//
//  Created by Rohit Navalgund on 28/10/17.
//  Copyright © 2017 RNavalgund. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit
import CoreMotion

class MainMenu: SKScene {
    var mainMenuView = UIView()
    
    let btn = UIButton()
    
    override func didMove(to view: SKView) {
        mainMenuView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let width = mainMenuView.bounds.width
        let height = mainMenuView.bounds.width
        
        btn.backgroundColor = UIColor.white
        btn.frame = CGRect.init(x: width/2, y: height/2, width: 90, height: 50)
        btn.setTitle("Play", for: .normal)
        btn.addTarget(self, action: #selector(btnPressed(_:)), for: .touchUpInside)

        //btnPressed(btn)
        
        view.addSubview(btn)
        view.addSubview(mainMenuView)
        
    }
    @IBAction func btnPressed(_ sender: UIButton) {
        if btn.isSelected == true {
        if let view = self.view {
            // Load the SKScene from 'Level2.sks'
            if let scene = SKScene(fileNamed: "Level1") {
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
}
