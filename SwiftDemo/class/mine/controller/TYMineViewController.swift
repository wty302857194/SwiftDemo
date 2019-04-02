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
    // 存储我的关注数据
    var concerns = [MyConcern]()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.TYFirstSectionTableViewCell
        tableView.register(UINib(nibName: String(describing: TYMineTableViewCell.self), bundle: nil), forCellReuseIdentifier: NSStringFromClass(TYMineTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: TYFirstSectionTableViewCell.self), bundle: nil), forCellReuseIdentifier: NSStringFromClass(TYFirstSectionTableViewCell.self))
        tableView.tableHeaderView = noLogInHeaderView
        
        view.addSubview(tableView)
        
        
        
        NetWorkTool.mineRequestData { (sections) in
            let jsonString = "{\"text\":\"我的关注\",\"grey_text\":\"\"}"
            let model = MineModel.deserialize(from: jsonString)
            var myCellModel = [MineModel]()
            myCellModel.append(model!)
            
            self.sectionsArr.append(myCellModel)
            self.sectionsArr += sections
            self.tableView.reloadData()
            
            NetWorkTool.loadMyConcern(completionHandler: { (concerns) in
                self.concerns = concerns
                let indexSet = IndexSet(integer: 0)
                self.tableView.reloadSections(indexSet, with: .automatic)
            })
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self;
        return tableView
    }()
    
    lazy var noLogInHeaderView : TYNoLogInHeaderView =  {
        let noLogInHeaderView = Bundle.main.loadNibNamed("\(TYNoLogInHeaderView.self)", owner: nil, options: nil)?.last as! TYNoLogInHeaderView
        return noLogInHeaderView
    }()
    
    
}


extension TYMineViewController {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsArr[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return (concerns.count == 0 || concerns.count == 1) ? 40 : 120
        }
        return 40
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
        let sections = sectionsArr[indexPath.section]
        let mineModel = sections[indexPath.row]
        
        if indexPath.section == 0&&indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(TYFirstSectionTableViewCell.self), for: indexPath) as! TYFirstSectionTableViewCell
            cell.mineModel = mineModel
            cell.myConcerns = concerns
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(TYMineTableViewCell.self), for: indexPath) as! TYMineTableViewCell
        cell.mineModel = mineModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 10))
        view.backgroundColor = UIColor.globalBackgroundColor()
        return view
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        if offsetY < 0 {
            let totalOffset = 280 + abs(offsetY)
            let f = totalOffset / 280
            noLogInHeaderView.backView.frame = CGRect(x: -kScreenWidth * (f - 1) * 0.5, y: offsetY, width: kScreenWidth * f, height: totalOffset)
        }
        
    }
}
