//
//  GameScene.swift
//  LandmarkDash Beta
//
//  Created by Danielle Abrams on 2/13/25.
//

import SpriteKit
import SwiftUI
import GameKit

struct PhysicsCategory {
    static let none: UInt32 = 0
    static let all: UInt32 = UInt32.max
    static let car: UInt32 = 0b1
    static let memento: UInt32 = 0b10
//    static let obstacle: UInt32 = 0b101
//    static let road: UInt32 = 0b1010

}
func random() -> CGFloat {
  return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
}

func random(min: CGFloat, max: CGFloat) -> CGFloat {
  return random() * (max - min) + min
}

class GameScene: SKScene, ObservableObject {
    @Published var gameOver = false
    let car = SKSpriteNode(imageNamed: "carRear")
    @Published var score = 0
    var scoreLabel = SKLabelNode()
    


    
    
    let mementos = [SKSpriteNode(imageNamed: "memento0"),
                    SKSpriteNode(imageNamed: "memento1"),
                    SKSpriteNode(imageNamed: "memento2"),
                    SKSpriteNode(imageNamed: "memento3"),
                    SKSpriteNode(imageNamed: "memento4")]
    
    
    override func didMove(to view: SKView) {
       scene?.size = CGSize(width: 1024, height: 768)
        
        let horizon = SKSpriteNode(imageNamed: "buildings")
        let skyBehind = SKSpriteNode(imageNamed: "backgroundSky")
        let background = SKSpriteNode(imageNamed: "grassNoRoad")
        //leave the buildings alone!!
        
        horizon.position = CGPoint(x:500, y:750)
        horizon.zPosition = 1
        horizon.setScale(0.5)
        addChild(horizon)
        
        
        skyBehind.position = CGPoint(x:500, y:750)
        skyBehind.zPosition = -1
        skyBehind.setScale(1.5)
        addChild(skyBehind)
        
        background.position = CGPoint(x: 500, y:200)
   
        background.zPosition = -1
        background.setScale(3.25)
        addChild(background)
        
      
        car.name = "Car"
        car.position.y = frame.minY + 200
       car.position.x = frame.maxX/2
        car.zPosition = 2
        car.setScale(0.25)
        
        //Add Physics to car
        car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
       car.physicsBody?.isDynamic = false
       car.physicsBody?.categoryBitMask = PhysicsCategory.car
        car.physicsBody?.collisionBitMask = PhysicsCategory.memento
        
       addChild(car)
      
//        func sceneTouched(touchLocation:CGPoint) {
//            move(sprite: car, direction: touchLocation)
//
//                }
  
        run(SKAction.repeatForever(
          SKAction.sequence([
            SKAction.run(createRoad),
            SKAction.wait(forDuration: 1.0)
         
          ])
        ))
        
       
        run(SKAction.repeatForever(
          SKAction.sequence([
            SKAction.run(spawnMemento),
            SKAction.wait(forDuration: 5.0)
          ])
        ))
        
        let backgroundMusic = SKAudioNode(fileNamed: "backgroundmusic.wav")
        backgroundMusic.autoplayLooped = true
        addChild(backgroundMusic)
        
        let carsounds = SKAudioNode(fileNamed: "carsounds.mp3")
        carsounds.autoplayLooped = true
        addChild(carsounds)
        
        
        scoreLabel.text = "Score: \(score)"
        scoreLabel.fontName = "AvenirNextCondensed-Heavy"
        scoreLabel.fontSize = 50
        scoreLabel.fontColor = .blue
        scoreLabel.zPosition = 10
        scoreLabel.position = CGPoint(x: 100, y: 100)
        addChild(scoreLabel)
    }
    
    func move(sprite: SKSpriteNode, direction: CGPoint) {
        if direction.x >= sprite.position.x {
            sprite.position.x = sprite.position.x + CGFloat(10)
    
        } else if direction.x <= sprite.position.x {
            sprite.position.x = sprite.position.x - CGFloat(10)
        }
        
    }
  
    
    func sceneTouched(touchLocation:CGPoint) {
       // lastTouchLocation = touchLocation
        move(sprite: car, direction: touchLocation)
       
            }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        sceneTouched(touchLocation: touchLocation)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        sceneTouched(touchLocation: touchLocation)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
     

     
      
    }
    func carHitMemento(memento: SKSpriteNode) {
        memento.removeFromParent()
        updateScore()
    }
        
        
    func spawnMemento() {
        let i = Int.random(in: 0..<5)
       let memento = mementos[i]
        
        
        memento.setScale(0.25)
        memento.zPosition = 1
        memento.physicsBody = SKPhysicsBody(rectangleOf: memento.size)
        
        memento.physicsBody?.isDynamic = false
        memento.physicsBody?.categoryBitMask = PhysicsCategory.memento
        memento.physicsBody?.contactTestBitMask = PhysicsCategory.car
        let actualY = random(min: 200, max: 400)
        let actualX = random(min: 300, max: 600)
        memento.position = CGPoint(x:actualX, y:actualY)
        memento.physicsBody?.usesPreciseCollisionDetection = true
        addChild(memento)
       // let actualDuration = random(min: CGFloat(1.0), max: CGFloat(4.0))
        
        let scaleUp = SKAction.scale(by: 1.25, duration: 3.0)
        
        let actionMove = SKAction.move(
            to: CGPoint(x: memento.position.x,
                        y: -memento.size.width/2),
        
            duration: 3.0)
        
        let actionMoveDone = SKAction.removeFromParent()
        memento.run(scaleUp)
        memento.run(SKAction.sequence([actionMove, actionMoveDone]))
        
        
        
       
        
     //   SKAction.wait(forDuration: 3.0)
       
    }
    
    
    
//    func moveCarToward(location: CGPoint) {
//        let offset = CGPoint(x: location.x - car.position.x,
//                             y: car.position.y)
//
//        let length = sqrt(Double(offset.x * offset.x + offset.y * offset.y))
//    }
    
    


    func createRoad(){
        let midLine = SKSpriteNode(imageNamed: "whiteLines")
        
//        midLine.physicsBody = SKPhysicsBody(rectangleOf: midLine.size)
//        midLine.physicsBody?.isDynamic = true
        
        midLine.setScale(0.25)
       midLine.alpha = 1
      //  midLine.name = "MiddleLines"
        midLine.zPosition = -1
        midLine.position.x = frame.maxX/2
        midLine.position.y = frame.maxY/2
        
        addChild(midLine)
        
        
        let moveAction = SKAction.moveTo(y: -360, duration: 2)
        let sizeUp = SKAction.scale(by: 2, duration: 2)
       let deleteAction = SKAction.removeFromParent()
       let combine = SKAction.sequence([ moveAction, deleteAction])
        midLine.run(sizeUp)
      midLine.run(combine)
        
    }
    
    func updateScore() {
        score += 10
        scoreLabel.text = "Score: \(score)"
    }
    
    func gameOverFunc() {
        removeAllChildren()
        gameOver = true
        
    }
    
//    func moveCar(){
//        let moveRight = SKAction.moveTo(x: car.position.x + 10, duration: 1)
//        let moveLeft = SKAction.moveTo(x: car.position.x - 10, duration: 1)
//
//        if car.position.x <= -100 {
//            car.position.x = -100
//
//        }
//        if car.position.x >= 100 {
//            car.position.x = 100
//
//        }
//    }

}


extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        // arrange two bodies so they are sorted by their category bit masks.
        
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        
        // Car hits Memento
        
        if ((firstBody.categoryBitMask & PhysicsCategory.car != 0) &&
            (secondBody.categoryBitMask & PhysicsCategory.memento != 0)) {
            if let car = firstBody.node as? SKSpriteNode,
               let memento = secondBody.node as? SKSpriteNode {
                carHitMemento(memento: memento)
            }
        }
//        if contactA.categoryBitMask == PhysicsCategory.car && contactB.categoryBitMask == PhysicsCategory.memento {
//            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
//            // updateScore()
//            carHitMemento(memento: contactB.node as! SKSpriteNode)
//
//        }
        
    }
}
