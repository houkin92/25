//
//  File.swift
//  微信
//
//  Created by 方瑾 on 2019/2/8.
//  Copyright © 2019 方瑾. All rights reserved.
//

import Foundation
struct friendInfo {
    var name : String?//姓名
    var imageName : String?//照片
    var sex : SexType?//性别
    var wechatID : String?//微信号
    var location : String?//地区
    var group : String?//分组
    
    init(name : String, imageName : String, sex : SexType, wechatID : String?,location : String?, group : String?) {
        self.name      = name
        self.imageName = imageName
        self.sex       = sex
        self.wechatID  = wechatID
        self.location  = location
        self.group     = group
    }
}
