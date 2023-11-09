//
//  GameViewModel.swift
//  ProjectApollo III
//
//  Created by Luca Aguiar on 08/11/23.
//

import SpriteKit
import SwiftUI


class GameScene: SKScene {
    
    private var videoNode: SKVideoNode!
    let background = SKSpriteNode(imageNamed: "Nebula")
    var player = SKSpriteNode()
    var playerFire = SKSpriteNode()
    var fireTimer = Timer()
    
    override func didMove(to view: SKView) {
        scene?.size = CGSize(width: 750, height: 1335)
        background.position = CGPoint(x: size.width / 2, y:  size.height / 2)
        background.setScale(1.5)
        background.zPosition = 1
        addChild(background)
        makePlayer(playerCh: 1)
        
        fireTimer = .scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(playerFireFunc), userInfo: nil, repeats: true)
    }
    
    func makePlayer(playerCh: Int) {
        var shipName = ""
        
        switch playerCh {
        case 1:
            shipName = "ShipBasic"
            
        case 2:
            shipName = "ShipBoss"
            
        default:
            shipName = "ShipEnimy"
        }
        
        player = .init(imageNamed: shipName)
        player.position = CGPoint(x: size.width / 2, y: 120)
        player.zPosition = 10
        player.setScale(1.5)
        addChild(player)
    }
    
    @objc func playerFireFunc() {
        playerFire = .init(imageNamed: "")
        playerFire.position = player.position
        playerFire.zPosition = 3
        playerFire.setScale(0.01)
        addChild(playerFire)
        
        let moveAction = SKAction.moveTo(y: 1400, duration: 1)
        let deleteAction = SKAction.removeFromParent()
        let combine = SKAction.sequence([moveAction,deleteAction])
        
        playerFire.run(combine)
    }
}

//        let video = SKVideoNode(fileNamed: "video")
//        video.size = CGSize(width: 750, height: 1335)
//        addChild(video)
//        videoNode.position = CGPoint(x: frame.midX, y: frame.midY)
//        videoNode.play()
