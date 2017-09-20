//
//  SecondViewController.swift
//  swiftTry
//
//  Created by nhl on 2017/9/19.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController,FTVCdelegte,ChangeBtnDelege{
    @IBOutlet weak var editBtn: UIButton!
    var base: baseClass = baseClass()
    var myStr=String()
    var tmpString=String()
    
    //实现协议的方法
    //更改主题名字
    func change(title: String) {
//        self.title = title
    }
    //更改背景色
    func ChangeColoer(Coloer: UIColor) {
//        self.view.backgroundColor = Coloer
    }
    //是否成功
    func ChangSucces(YON: Bool) {
        print(YON)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("myStr内容是多少:\(myStr)")
        // Do any additional setup after loading the view.
    }

    func changeBtnBackgroundColor(color:UIColor){
        self.editBtn.backgroundColor=color
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func BackLastVCAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func tiaozhuanBtnAction(_ sender: Any) {
        UserDefaults().setValue("王珊", forKey: "userName")
        self.base.cacheSetString(key: "sign", value: "通过NSUserDefaults传递方式3")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let threeVC = storyboard.instantiateViewController(withIdentifier: "threeViewControllerID") as! threeViewController
        threeVC.delegate_zsj = self
        threeVC.delegateChangeBtn=self
        
        threeVC.bbchange={
            ( title:String,myColor:UIColor) in
            self.title=title
            self.view.backgroundColor=myColor
        }
        
        threeVC.changeMyBtnTitle={
            (myBtnTitle:String) in
            self.editBtn.setTitle(myBtnTitle, for: UIControlState.normal)
        }
        
        self.navigationController?.pushViewController(threeVC, animated: true)
    }
    
    
}
