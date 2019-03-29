//
//  TYMineViewController.swift
//  SwiftDemo
//
//  Created by wbb on 2019/3/25.
//  Copyright © 2019 cjh. All rights reserved.
//

import UIKit

class TYMineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
     var sectionsArr = [[MineModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
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
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self;
        return tableView
    }()
}


extension TYMineViewController {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsArr[section].count
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

    optional public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 10
    }

    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsArr.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellIdentifier)
        }
        let sections = sectionsArr[indexPath.section]
        let mineModel = sections[indexPath.row]

        cell?.textLabel?.text = mineModel.text
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 10))
        view.backgroundColor = UIColor.gray
        return view
    }
}
