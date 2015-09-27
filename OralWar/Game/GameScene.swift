//
//  GameScene.swift
//  OralWar
//
//  Created by MrSmall on 2015/08/26.
//  Copyright (c) 2015年 MrSmall. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var uiView: UILayerView!
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    func setUiLayerView(view: UILayerView) {
        uiView = view
        self.view!.addSubview(uiView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        
        // show background for debug
        let backtooth = SKSpriteNode(imageNamed: "backtooth01.png")
        backtooth.size = self.size
        backtooth.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)
        self.addChild(backtooth)
        
        print("w : \(self.size.width), y : \(self.size.height)")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
