//
//  baseButton.swift
//  swiftTry
//
//  Created by nhl on 2017/9/21.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit

class baseButton: UIButton {
@IBInspectable var BtnRadiusValue: CGFloat = 0//圆角
@IBInspectable var BtnBorderColor: UIColor = UIColor.clear //边框颜色
@IBInspectable var BtnBorderWidth: CGFloat = 0.0 //边框宽度

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
 */
 override func draw(_ rect: CGRect) {
        // Drawing code
    self.layer.cornerRadius=BtnRadiusValue
    self.layer.masksToBounds=true
    self.layer.borderColor=BtnBorderColor.cgColor
    self.layer.borderWidth=BtnBorderWidth
    }
 

}
