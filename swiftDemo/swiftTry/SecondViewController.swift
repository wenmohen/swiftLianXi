//
//  SecondViewController.swift
//  swiftTry
//
//  Created by nhl on 2017/9/19.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var myStr=String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("myStr内容是多少:\(myStr)")
        // Do any additional setup after loading the view.
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
}
