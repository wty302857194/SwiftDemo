//
//  MineModel.swift
//  SwiftDemo
//
//  Created by wbb on 2019/3/27.
//  Copyright © 2019 cjh. All rights reserved.
//

import Foundation
import HandyJSON

struct MineModel: HandyJSON {
    
    var grey_text: String = ""
    var text: String = ""
    var url: String = ""
    var key: String = ""
    var tip_new: Int = 0
    
}

struct MyConcern: HandyJSON {
    
    var name: String?
    var url: String?
    var total_count: Int?
    var description: String?
    var time: String?
    var type: String?
    var icon: String?
    var userid: Int?
    var is_verify: Bool?
    var media_id: Int?
    var tips: Bool?
    var id: Int?
    var user_auth_info: String?
    var userAuthInfo: UserAuthInfo? {
        return UserAuthInfo.deserialize(from: user_auth_info)
    }
}

struct UserAuthInfo: HandyJSON {
    var auth_type: Int?
    var auth_info: String?
}
