//
//  GameScene.swift
//  RunnerGameApp
//
//  Created by Bletty Jans on 15/03/17.
//  Copyright © 2017 cs2680. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene , SKPhysicsContactDelegate

{
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    var cat : CatNode!
    var platforms: Array<SKSpriteNode>?
    
    override func didMove(to view: SKView) {
        
        let backgroundTexture = SKTexture(image: #imageLiteral(resourceName: "background"))
        let backgroundNode = SKSpriteNode(texture: backgroundTexture)
        backgroundNode.size = CGSize(width: 1334, height: 750)
        self.addChild(backgroundNode)
        
        let catTexture = SKTexture(image: #imageLiteral(resourceName: "cat_run_1"))
        let catSize  = CGSize (width: 140, height : 140)
        self.cat = CatNode(texture: catTexture, color: UIColor.white, size: catSize)
        self.cat.position = CGPoint(x: -520, y: -200)
        self.addChild(self.cat)
        
        self.cat.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 70, height: 140))
        
        self.platforms = Array<SKSpriteNode>()
        
        for i in 0 ..< 10
        
        {
        
            let platformX = (-440 + (i * 400))
            let platform = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "platform")))
            platform.size = CGSize(width: 256, height: 64)
            platform.position = CGPoint(x: platformX, y: -232)
            platform.physicsBody = SKPhysicsBody(rectangleOf : platform.size)
            
            platform.physicsBody?.isDynamic = false
            
            platform.physicsBody?.contactTestBitMask = 1
            
            self.platforms?.append(platform)
            self.addChild(platform)
            
            
           // let moveAction = SKAction
            
            let rainEmitter = SKEmitterNode(fileNamed: "SnowParticle")
            rainEmitter?.position = CGPoint(x: 0, y: 400)
            self.addChild(rainEmitter!)
            
           // self.physicsWorld.contactDelegate = self

        
        
        }
        
    }

func didBegin(_ contact: SKPhysicsContact)
{
    let cat = (contact.bodyA.node as? CatNode) ?? (contact.bodyB.node as? CatNode)
    
    if cat?.isJumping ?? false
    {	cat?.startRunAnimation()
    }
}

    
    
    func touchDown(atPoint pos : CGPoint) {
       
        
        self.cat.startJumpAnimation()
        cat.jump()
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    
}
