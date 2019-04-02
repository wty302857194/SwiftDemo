//
//  TYMyConcernCollectionViewCell.swift
//  SwiftDemo
//
//  Created by wbb on 2019/4/1.
//  Copyright © 2019 cjh. All rights reserved.
//

import UIKit
import Kingfisher

class TYMyConcernCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var myConcern: MyConcern? {
        didSet {
            imgView.kf.setImage(with: URL(string: (myConcern?.icon)!))
            titleLab.text = myConcern?.name
        }
    }
    

}
