//
//  GameScene.swift
//  OralWar
//
//  Created by MrSmall on 2015/08/26.
//  Copyright (c) 2015年 MrSmall. All rights reserved.
//

import SpriteKit

let STAGELIST: String = "stagelist"

class GameScene: SKScene {
    
    var uiView: UILayerView!
    var oralPieceMap: OralPieceMap!
    var user: User!
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    // set user info
    func setUser(user: User) {
        self.user = user
    }
    
    // set ui layer
    func setUiLayerView(view: UILayerView) {
        uiView = view
        self.view!.addSubview(uiView)
    }
    
    // set up piece map
    func setUp() -> Bool {
        // load UserDefaults
        guard let user = UserDefaultsUtil.getUserInfo() else {
            return false
        }
        let stage = user.getStage()
        print("stage \(stage)")
        
        // read stagelist.json
        let util: JsonUtil = JsonUtil()
        let data = util.parseJson(STAGELIST, type: JSON_FORMAT.FILE)
        guard let stageData: NSArray = data as? NSArray else {
            return false
        }
        
        var uri = ""
        for elm in stageData {
            print(elm)
            guard let stageInfo: Stage = ConvertUtil.toStage(elm as? NSDictionary) else {
                continue
            }
            if stage == stageInfo.getId() {
                uri = stageInfo.getUri()
            }
        }
        
        if uri == "" {
            // uri empty
            return false
        }
        print(uri)
        // get stage data
        guard let stageMapData = util.parseJson(uri) else {
            //return false
            return true // TODO for debug
        }
        
        // convert oralpiecemap
        oralPieceMap = ConvertUtil.toOralPieceMap(stageMapData as! NSDictionary)
        
        // TODO set info data to ui view
        return true
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
        
        // TODO for debug
        let ary = TextureUtil.loadDivImage("chip_pumpkin1.png", col: 3, row: 4)
        let node: SKSpriteNode = SKSpriteNode(texture: ary[0])
        node.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)
        node.name = "pumpkin"
        //let action: SKAction = SKAction.animateWithTextures(ary, timePerFrame: 0.2)
        //let forever: SKAction = SKAction.repeatActionForever(action)
        //node.runAction(forever)
        self.addChild(node)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        if let touch = touches.first as UITouch! {
            let location = touch.locationInView(self.view)
            let newlocation = CGPoint(x: location.x, y: self.size.height - location.y)
            
            // TODO for debug
            print(location)
            let node = self.childNodeWithName("pumpkin")
            let action = SKAction.moveTo(newlocation, duration: 1.0)
            node?.runAction(action)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
