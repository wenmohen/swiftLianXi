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
var myViewController:UIViewController?
    
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
//    self.addTarget(myViewController, action:#selector(myclicked), for: UIControlEvents.touchUpInside)
//    self.addTarget(myViewController, action: #selector(myclicked(sender:)), for: UIControlEvents.touchUpInside)

    }
 

}
//func myclicked(sender: UIButton) {
//    sender.superview!.animateWhenClicked()
//}
//
//
//extension UIView {
//    func animateWhenClicked() {
//        self.backgroundColor = UIColor(white: 0.9, alpha: 0.5)
//        self.layer.transform = CATransform3DMakeScale(1, 1, 0)
//        UIView.animate(withDuration: 0.9, animations: {
//            self.backgroundColor = UIColor.white
//            self.layer.transform = CATransform3DMakeTranslation(1, 1, 1)
//        })
//    }
//}
