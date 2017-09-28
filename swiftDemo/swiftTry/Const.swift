//
//  Const.swift
//  swiftTry
//
//  Created by nhl on 2017/9/22.
//  Copyright © 2017年 nhl. All rights reserved.
//


//可以定义一些常量.类似宏文件

import UIKit

let screenHeight = UIScreen.main.bounds.size.height//整个屏幕的高

let screenWidth = UIScreen.main.bounds.size.width//整个屏幕的宽

//判断iPhone4
let IPHONE4_DEV:Bool! = (UIScreen.main.bounds.size.height == 480) ? true : false

//判断iPhone5/5c/5s
let IPHONE5_DEV:Bool! = (UIScreen.main.bounds.size.height == 568) ? true : false

//判断iPhone6/6s
let IPHONE6s_DEV:Bool! = (UIScreen.main.bounds.size.height == 667) ? true : false

//判断iPhone6p
let IPHONE6p_DEV:Bool! = (UIScreen.main.bounds.size.height > 667) ? true : false

//判断iPad
let IPAD_DEV:Bool! = (UIDevice.current.userInterfaceIdiom == .pad) ? true : false

/// 重置透明度的随即色
///
/// - parameter R: red
/// - parameter G: green
/// - parameter B: black
/// - parameter A: alpha (0~1之间)
///
func owerRandomColorAlpha(R:CGFloat,G:CGFloat,B:CGFloat,A:CGFloat) -> UIColor{
    return UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: A)
}
