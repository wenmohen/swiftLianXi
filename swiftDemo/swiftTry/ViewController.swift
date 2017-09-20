//
//  ViewController.swift
//  swiftTry
//
//  Created by nhl on 2017/8/24.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    var button1=UIButton()

    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    button1=UIButton(type: UIButtonType.system)
    let rect = CGRect(x:10,y:10,width:100,height:30)
    button1.frame=rect
    button1.setTitle("传值", for: UIControlState.normal)
    button1.addTarget(self, action: #selector(Button1Action), for: UIControlEvents.touchUpInside)
    self.view.addSubview(button1)
    
    }
    
    
    func Button1Action(button:UIButton)  {
//        let secondVC = SecondViewController()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewControllerID") as! SecondViewController
        secondVC.myStr="wrw"
        self.present(secondVC, animated: true, completion: nil)

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 //点击按钮弹出商家活动页面
    @IBAction func myBtnAction(_ sender: Any) {
        let myView = Bundle.main.loadNibNamed("ActivityAlertView", owner: nil, options: nil)?.first as? ActivityAlertView
        myView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        myView?.center = self.view.center
        myView?.jianStringPT = "满25减3,满多少"
        if myView != nil {
            self.view.addSubview(myView!)
    }
}
    
    //点击按钮2弹出商家活动页面，主要测试数据是否可以改变
    @IBAction func clickTiaoZhanAction(_ sender: Any) {
        let myView = Bundle.main.loadNibNamed("ActivityAlertView", owner: nil, options: nil)?.first as? ActivityAlertView
        myView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        myView?.center = self.view.center
        myView?.jianStringPT = "满25减3,满60减15，满80减30,满100减45,满120减65，满180减80"
        if myView != nil {
            self.view.addSubview(myView!)
        }

    }
    

}

