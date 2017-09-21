//
//  threeViewController.swift
//  swiftTry
//
//  Created by nhl on 2017/9/20.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit
//要创建一个协议
protocol FTVCdelegte : NSObjectProtocol{
    //在协议里面，声明许多方法
    // 第一个，改变标题
    func change(title:String)
    //第二个，改变背景色
    func ChangeColoer (Coloer:UIColor)
    //是否成功的标志
    func ChangSucces(YON:Bool)
}


protocol ChangeBtnDelege {
    func changeBtnBackgroundColor(color:UIColor)
}
class threeViewController: UIViewController {
    //创建一个遵守协议的对象
    var delegate_zsj:FTVCdelegte?
    
    var delegateChangeBtn:ChangeBtnDelege?
    
    var bbchange:((_ title:String,_ myColor:UIColor)->Void)?
    
    var changeMyBtnTitle:((_ btnTitle:String)->Void)?
    
    var base: baseClass = baseClass()
    
    var myStr=String()

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("页面属性传值：\(myStr)")
        print(base.cacheGetString(key: "sign"))
        print(UserDefaults().string(forKey: "userName") ?? "")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation
    */
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let theSegue=segue.destination as! SecondViewController
        theSegue.myStr="第三个控制器传值"
    }
 

    @IBAction func backBtnAction(_ sender: UIButton) {
        delegate_zsj?.change(title: "首页")
        delegate_zsj?.ChangeColoer(Coloer: UIColor.red)
        delegate_zsj?.ChangSucces(YON: true)
        delegateChangeBtn?.changeBtnBackgroundColor(color: UIColor.gray)
        bbchange?("文档",UIColor.green)
        changeMyBtnTitle?("完成")
        self.navigationController?.popViewController(animated: true)
    }
    
}
