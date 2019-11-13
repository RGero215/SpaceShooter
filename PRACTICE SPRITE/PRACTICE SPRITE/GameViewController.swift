//
//  GameViewController.swift
//  PRACTICE SPRITE
//
//  Created by Ramon Geronimo on 10/23/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks' view = SKView(frame: view.bounds)
            if let view = self.view as! SKView? {
                let scene = GameScene(size: view.bounds.size)
                
//                let background = createNodeObject(fileNamed: "background")
//                background.position = CGPoint(x: view.bounds.size.width, y: view.bounds.size.height)
//                background.zPosition = -1
//                scene.addChild(background)
//
//                let ship = createNodeObject(fileNamed: "playerShip2_red")
//                ship.position = CGPoint(x: view.bounds.size.width / 2, y: 80)
//
//                scene.addChild(ship)
//
//                randomMeteor(scene: scene)
                
                
                
               
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
               
                // Present the scene
                view.presentScene(scene)
               
                // Scene properties
                view.showsPhysics = false
                view.ignoresSiblingOrder = true
                view.showsFPS = true
                view.showsNodeCount = true
               }
        }
    }

    func createNodeObject(fileNamed: String) -> SKSpriteNode {
         
           //let node = SKSpriteNode(fileNamed: fileNamed)
           let node  = SKSpriteNode(imageNamed: fileNamed)
           print(node)
           return node
           
    }
    
    func randomPoints(node: SKSpriteNode) {
        let width = view.bounds.width
        let height = view.bounds.height
        let x = CGFloat.random(in: 0...width)
        let y = height
        node.position = CGPoint(x: x, y: y)

    }
    
    func randomMeteor(scene: GameScene) {
        
        // Brown Meteor Big
        let brownMeteor = createNodeObject(fileNamed: "meteorBrown_big3")
        randomPoints(node: brownMeteor)
        scene.addChild(brownMeteor)
        
        // Grey Meteor Big
        let greyMeteor = createNodeObject(fileNamed: "meteorGrey_big4")
        randomPoints(node: greyMeteor)
        scene.addChild(greyMeteor)
        
        // Grey Meteor Medium
        let greyMediumMeteor = createNodeObject(fileNamed: "meteorGrey_med1")
        randomPoints(node: greyMediumMeteor)
        scene.addChild(greyMediumMeteor)
        
        // Wing Green
        let wingGreen = createNodeObject(fileNamed: "wingGreen_6")
        randomPoints(node: wingGreen)
        scene.addChild(wingGreen)
        
        // Beam
        let beamO = createNodeObject(fileNamed: "beam0")
        randomPoints(node: beamO)
        scene.addChild(beamO)
        
        // Wing Red
        let wingRed = createNodeObject(fileNamed: "wingRed_2")
        randomPoints(node: wingRed)
        scene.addChild(wingRed)
        
        runAction(scene: scene) {
            self.randomMeteor(scene: scene)
        }
        
    }
    
    func runAction(scene: GameScene, meteors: @escaping () -> Void) {
        scene.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        scene.run(SKAction.repeat(SKAction.sequence([SKAction.run(meteors), SKAction.wait(forDuration: 0.1)]), count: 100))
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
   
    
}
