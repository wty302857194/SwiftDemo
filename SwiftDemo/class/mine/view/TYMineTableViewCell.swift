//
//  TYMineTableViewCell.swift
//  SwiftDemo
//
//  Created by wbb on 2019/3/29.
//  Copyright © 2019 cjh. All rights reserved.
//

import UIKit

class TYMineTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var rightLab: UILabel!
    @IBOutlet weak var jianTouImg: UIImageView!
    var mineModel : MineModel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLab.text = ""
        rightLab.text = ""
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func addDataSource(mineModel:MineModel) {
        self.mineModel = mineModel
        
        titleLab.text = mineModel.text
        rightLab.text = mineModel.grey_text
        
    }
}
