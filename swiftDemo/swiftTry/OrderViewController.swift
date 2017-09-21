//
//  OrderViewController.swift
//  swiftTry
//
//  Created by nhl on 2017/9/21.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var arrData:Array<Any> = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }else {
            return 2
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let  cell:OrderTableViewCell
= tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCellID") as! OrderTableViewCell
            cell.backgroundColor=UIColor.white
            cell._loadCellData(dic: arrData[indexPath.row] as! NSDictionary)
            return cell
        }else {
            let  cell:myCollectionTabCell
                = tableView.dequeueReusableCell(withIdentifier: "myCollectionTabCellID") as! myCollectionTabCell
            cell.backgroundColor=UIColor.white
//            cell._loadCellData(dic: arrData[indexPath.row] as! NSDictionary)
            return cell
            
            
        }
    }


    @IBOutlet weak var orderTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        arrData=[["totalPrice":"45","orderTime" :"2017-09-08 12：00" ,"shopInfo" :"香禾米线" ],["totalPrice":"15" ,"orderTime" :"2017-09-10 12:23" ,"shopInfo" :"柳州螺蛳粉" ],["totalPrice":"22" ,"orderTime" :"2017-09-09 10：22" ,"shopInfo" :"铜锣湾米线" ],["totalPrice":"4","orderTime" :"2017-09-08 12：00" ,"shopInfo" :"香禾米线" ],["totalPrice":"115" ,"orderTime" :"2017-09-10 12:23" ,"shopInfo" :"柳州螺蛳粉" ],["totalPrice":"202" ,"orderTime" :"2017-09-09 10：22" ,"shopInfo" :"铜锣湾米线" ],["totalPrice":"435","orderTime" :"2017-09-08 12：00" ,"shopInfo" :"香禾米线" ],["totalPrice":"15" ,"orderTime" :"2017-09-10 12:23" ,"shopInfo" :"柳州螺蛳粉" ]]
       _loadInitView()
        // Do any additional setup after loading the view.
    }

    //加载view
    func _loadInitView(){
        self.orderTableView.dataSource=self
        self.orderTableView.delegate=self
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

}
