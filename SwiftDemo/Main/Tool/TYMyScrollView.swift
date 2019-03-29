//
//  TYMyScrollView.swift
//  SwiftDemo
//
//  Created by wbb on 2019/3/27.
//  Copyright © 2019 cjh. All rights reserved.
//

import UIKit

class TYMyScrollView: UIScrollView {

    init(frame:CGRect,numOfLable:() -> Int,lableOfIndex:(_ index : Int) -> UILabel) {
        super.init(frame: frame)

            backgroundColor = UIColor.gray
            
            let count = numOfLable()
            var x_Abscissa: CGFloat = 0
            
            for i in 0..<count {
                let lab = lableOfIndex(i)
                lab.frame = CGRect(x: x_Abscissa, y: 0, width: lab.bounds.width, height: bounds.height)
                addSubview(lab)
                x_Abscissa += lab.bounds.width
            }
            contentSize = CGSize(width: x_Abscissa, height: bounds.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
