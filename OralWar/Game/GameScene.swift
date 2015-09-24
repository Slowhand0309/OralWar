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
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
