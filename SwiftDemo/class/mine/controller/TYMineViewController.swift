//
//  TYMineViewController.swift
//  SwiftDemo
//
//  Created by wbb on 2019/3/25.
//  Copyright © 2019 cjh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class TYMineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
     var sectionsArr = [[MineModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: String(describing: TYMineTableViewCell.self), bundle: nil), forCellReuseIdentifier: NSStringFromClass(TYMineTableViewCell.self))
        
        view.addSubview(tableView)
        
        NetWorkTool.mineRequestData { (sections) in
            let jsonString = "{\"text\":\"我的关注\",\"grey_text\":\"\"}"
            let model = MineModel.deserialize(from: jsonString)
            var myCellModel = [MineModel]()
            myCellModel.append(model!)
            
            self.sectionsArr.append(myCellModel)
            self.sectionsArr += sections
            self.tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self;
        return tableView
    }()
}


extension TYMineViewController {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsArr[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsArr.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellIdentifier = "cell"
//        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
//        if cell == nil {
//            cell = TYMineTableViewCell(style: .default, reuseIdentifier: cellIdentifier)
//        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(TYMineTableViewCell.self), for: indexPath) as! TYMineTableViewCell
        let sections = sectionsArr[indexPath.section]
        let mineModel = sections[indexPath.row]

        cell.addDataSource(mineModel: mineModel)
//        cell.titleLab?.text = mineModel.text
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 10))
        view.backgroundColor = UIColor.globalBackgroundColor()
        return view
    }
}
