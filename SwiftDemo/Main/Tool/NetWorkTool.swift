//
//  NetWorkTool.swift
//  SwiftDemo
//
//  Created by wbb on 2019/3/26.
//  Copyright © 2019 cjh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetWorkToolProtocol {
    
    static func mineRequestData(cellBack:(_ sections : [[MineModel]]) -> ())
}

extension NetWorkToolProtocol {
    
    
    static func mineRequestData(cellBack:@escaping (_ sections : [[MineModel]]) -> ()) {
        let urlStr = BASE_URL + "/user/tab/tabs/?"
        let params = ["device_id":device_id]
        
        Alamofire.request(urlStr, method: .get, parameters: params).responseJSON(completionHandler: { (response) in
            
            guard response.result.isSuccess else {
                return
            }
            
            
            print("result==\(response.result)")
            // 返回结果，是否成功
            if let jsonValue:NSDictionary = response.result.value as? NSDictionary {
                let json = JSON(jsonValue)
                if let data = json["data"].dictionary {
                    if  let sections = data["sections"]?.array {
                        var sectionsArr = [[MineModel]]()
                        for items in sections {
                            var mineModel = [MineModel]()
                            for row in items.arrayObject! {
                                let mycellModel = MineModel.deserialize(from: row as? NSDictionary)
                                mineModel.append(mycellModel!)
                            }
                            sectionsArr.append(mineModel)
                        }
                        cellBack(sectionsArr)
                    }
                }
            }
        })
        
    }
}

struct  NetWorkTool: NetWorkToolProtocol{
    static func mineRequestData(cellBack: ([[MineModel]]) -> ()) {}
}