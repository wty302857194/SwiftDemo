//
//  UIColor+Extension.swift
//  SwiftDemo
//
//  Created by wbb on 2019/3/26.
//  Copyright © 2019 cjh. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r:CGFloat, g:CGFloat, b:CGFloat, alpha:CGFloat = 1.0) {
        self.init(displayP3Red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
        
    }
}

