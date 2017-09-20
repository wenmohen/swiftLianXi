//
//  baseClass.swift
//  swiftTry
//
//  Created by nhl on 2017/9/20.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit

//工具类,放置一些经常用到的方法
//通过userDefault存储数据
class baseClass{
    
    func cacheSetString(key: String,value: String){
        let userInfo = UserDefaults()
        userInfo.setValue(value, forKey: key)
    }
    
    func cacheGetString(key: String) -> String{
        let userInfo = UserDefaults()
        let tmpSign = userInfo.string(forKey: key)
        return tmpSign!
}
}
