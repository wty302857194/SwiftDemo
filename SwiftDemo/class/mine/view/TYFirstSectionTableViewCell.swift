//
//  TYFirstSectionTableViewCell.swift
//  SwiftDemo
//
//  Created by wbb on 2019/4/1.
//  Copyright © 2019 cjh. All rights reserved.
//

import UIKit

class TYFirstSectionTableViewCell: UITableViewCell{
    
    
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var rightLab: UILabel!
    @IBOutlet weak var jianTouImg: UIImageView!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var concernMode =  MyConcern()
    
    var myConcerns = [MyConcern]() {
        didSet {
            if myConcerns.count == 0 || myConcerns.count == 1 {
                collectionView.isHidden = true
                
                if myConcerns.count == 1 {
                    concernMode = myConcerns[0]
                } else {
                    iconImg.isHidden = false
                }
            } else {
                collectionView.reloadData()
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLab.text = ""
        rightLab.text = ""
        
        collectionView.register(UINib(nibName: String(describing: TYMyConcernCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: TYMyConcernCollectionViewCell.self))
        
        // 初始化
        collectionView.collectionViewLayout = MyConcernFlowLayout()
        
    }
    
    var mineModel: MineModel? {
        didSet {
            titleLab.text = mineModel?.text
            rightLab.text = mineModel?.grey_text
            
        }
    }
    
    
}

extension TYFirstSectionTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myConcerns.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TYMyConcernCollectionViewCell.self), for: indexPath) as! TYMyConcernCollectionViewCell
        let myConcern = myConcerns[indexPath.row]
        cell.myConcern = myConcern
        return cell
        
    }
    
    
}

class MyConcernFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        
        itemSize = CGSize(width: 58, height: 74)
        minimumLineSpacing = 5
        minimumInteritemSpacing = 5
        scrollDirection = .horizontal
        sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
    }
}
