//
//  TYHomeViewController.swift
//  SwiftDemo
//
//  Created by wbb on 2019/3/25.
//  Copyright © 2019 cjh. All rights reserved.
//

import UIKit

class TYHomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.

        let str = "你好世界"
        
        
        
        
        
        
        let sc = addScrollView(frame: CGRect(x: 0, y: 200, width: kScreenWidth, height: 40), numOfLable: { () -> Int in
            return 10
        }) { (index) -> UILabel in
            let lab = UILabel()
            lab.text = "index\(index)"
            lab.font = UIFont.systemFont(ofSize: 19)
            lab.sizeToFit()
            lab.textAlignment = NSTextAlignment.center
            lab.font = UIFont.systemFont(ofSize: 14)
            return lab
        }
        view.addSubview(sc)
    }
    func addScrollView(frame:CGRect,numOfLable:() -> Int,lableOfIndex:(_ index : Int) -> UILabel) -> UIScrollView {
        let scrollView = UIScrollView.init(frame: frame);
        scrollView.backgroundColor = UIColor.gray
        
        let count = numOfLable()
        var x_Abscissa: CGFloat = 0
        
        for i in 0..<count {
            let lab = lableOfIndex(i)
            lab.frame = CGRect(x: x_Abscissa, y: 0, width: lab.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(lab)
            x_Abscissa += lab.bounds.width
        }
        scrollView.contentSize = CGSize(width: x_Abscissa, height: scrollView.bounds.height)
        return scrollView;
    }
    
    /*
     // MARK: - Navigation、、、、、
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

