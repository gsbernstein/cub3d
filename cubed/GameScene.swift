//
//  GameScene.swift
//  cubed
//
//  Created by Greg Bernstein on 4/2/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String: GKGraph]()
    
    var things = [CGPoint]()
    
    private var lastUpdateTime : TimeInterval = 0
    
    override func sceneDidLoad() {
        
        self.lastUpdateTime = 0
        
        for node in self.children {
            if let map = node as? SKTileMapNode {
                setUpScene(map: map)
            }
        }
        
    }
    
    func setUpScene(map: SKTileMapNode) {
        let tileSize = map.tileSize
        
        let tileGroups = map.tileSet.tileGroups
        let grassGroup = tileGroups.first(where: { $0.name == "Grass "} )
        let grass = grassGroup.
        
        let texture = SKTexture(imageNamed: <#T##String#>)
        let grass = SKTileDefinition(texture: )
        
//        map.setTileGroup(<#T##tileGroup: SKTileGroup##SKTileGroup#>, andTileDefinition: <#T##SKTileDefinition#>, forColumn: <#T##Int#>, row: <#T##Int#>)
        
        for col in 0..<map.numberOfColumns {
            for row in 0..<map.numberOfRows {
                if let tileDefintion = map.tileDefinition(atColumn: col, row: row) {
                    things.append(CGPoint(x: col, y: row))
                }
            }
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0x31:
            () // spacebar
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
}
