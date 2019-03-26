//
//  TYTabBar.swift
//  SwiftDemo
//
//  Created by wbb on 2019/3/26.
//  Copyright © 2019 cjh. All rights reserved.
//

import UIKit

class TYTabBar: UITabBar {

    
    override init(frame: CGRect) {
        super.init(frame: frame);
        addSubview(midBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let height: CGFloat = frame.height
        let width: CGFloat = frame.width*0.2
        let y_henght: CGFloat = 0
        
        midBtn.center = CGPoint(x: frame.width*0.5, y: frame.height*0.5-7)

        var index = 0
        for  item in subviews {
            print("在 index = \(index) 位置上的值为 \(item)")
            
            if !item.isKind(of: NSClassFromString("UITabBarButton")!) {
                continue
            }
            
            let x_width = width*(index>1 ? CGFloat(index+1) : CGFloat(index))

            item.frame = CGRect(x: x_width, y: y_henght, width: width, height: height)
            index += 1
        }
        
    }
    
    
    lazy var midBtn: UIButton = {
        let midBtn = UIButton()
        midBtn.setBackgroundImage(UIImage.init(named: "feed_publish_44x44_"), for: .normal)
        midBtn.setBackgroundImage(UIImage.init(named: "feed_publish_press_44x44_"), for: .selected)
        midBtn.sizeToFit()
        
        return midBtn
    }()
    
}
