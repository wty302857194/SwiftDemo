//
//  TYBaseTabBarController.swift
//  SwiftDemo
//
//  Created by wbb on 2019/3/25.
//  Copyright © 2019 cjh. All rights reserved.
//

import UIKit

class TYBaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let titltColor = UIColor(red: 245 / 255.0, green: 90 / 255.0, blue: 93 / 255.0, alpha: 1.0)
//        self.tabBar.tintColor = UIColor(red: 245 / 255.0, green: 90 / 255.0, blue: 93 / 255.0, alpha: 1.0)
        
        
        // 修改标签栏选中时文字颜色、字体
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: titltColor, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13.0)], for: .selected)
        // 修改标签栏未选中时文字颜色、字体
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13.0)], for: .normal)
        // Do any additional setup after loading the view.
        
        setChildViewController(TYHomeViewController(), title: "首页", imageName: "home_tabbar_32x32_", selectImageName: "home_tabbar_press_32x32_")
        setChildViewController(TYVideoViewController(), title: "视频", imageName: "video_tabbar_32x32_", selectImageName: "video_tabbar_press_32x32_")
        setChildViewController(TYHuoshanViewController(), title: "小视频", imageName: "huoshan_tabbar_32x32_", selectImageName: "huoshan_tabbar_press_32x32_")
        setChildViewController(TYMineViewController(), title: "我的", imageName: "mine_tabbar_32x32_", selectImageName: "mine_tabbar_press_32x32_")
        setValue(TYTabBar(), forKey: "tabBar")
    }
    
    
    func setChildViewController(_ childController: UIViewController, title: String, imageName: String, selectImageName: String) {
        childController.title = title
        childController.tabBarItem.image = UIImage.init(named: imageName)
        childController.tabBarItem.selectedImage = UIImage.init(named: selectImageName)
        
        let nav = TYNavigationController(rootViewController: childController)
        
        addChild(nav)
    }

}
