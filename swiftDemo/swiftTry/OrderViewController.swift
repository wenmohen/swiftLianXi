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
    var titleArr:Array<Any> = []
    let screenh = UIScreen.main.bounds.size.height//整个屏幕的高
    let screenw = UIScreen.main.bounds.size.width//整个屏幕的宽
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
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == titleArr.count-1{
            return 50
        }else{
              return 55
            
        }

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerSectionView=UIView()
        let headerTitleLabel=UILabel()
        let headerLineView=UIView()
        let headerLookAllLabel=UILabel()
        headerSectionView.frame = CGRect(x:0,y:0,width:screenw,height:50)
        headerSectionView.backgroundColor=UIColor.white
        headerTitleLabel.frame = CGRect(x:20,y:0,width:screenw/2-20,height:49)
        headerTitleLabel.text=titleArr[section] as? String
        headerTitleLabel.textAlignment=NSTextAlignment.left
        headerTitleLabel.font=UIFont.boldSystemFont(ofSize: 18)
        headerSectionView.addSubview(headerTitleLabel)
        
        headerLookAllLabel.frame = CGRect(x:screenw/2,y:0,width:screenw/2-20,height:49)
        headerLookAllLabel.text="查看全部 >"
        headerLookAllLabel.textColor=UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        headerLookAllLabel.font=UIFont.systemFont(ofSize: 12)
        headerLookAllLabel.textAlignment=NSTextAlignment.right
        headerSectionView.addSubview(headerLookAllLabel)
        
        headerLineView.frame=CGRect(x:0,y:49,width:screenw,height:0.5)
        headerLineView.backgroundColor=UIColor.lightGray
        headerSectionView.addSubview(headerLineView)
        
        
        //建立手势识别器
        let headerTapGesture = UITapGestureRecognizer(target: self, action: #selector(headerViewTapGesture))
        //附加识别器到视图
        headerSectionView.addGestureRecognizer(headerTapGesture)
        headerSectionView.tag=section+100
        return headerSectionView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        let footerSectionView=UIView()
        let footerMoreLabel=UILabel()
        let footerLineView=UIView()
        footerSectionView.frame = CGRect(x:0,y:0,width:screenw,height:55)
        footerSectionView.backgroundColor=UIColor.clear
        footerMoreLabel.frame = CGRect(x:0,y:0,width:screenw,height:49)
        footerMoreLabel.backgroundColor=UIColor.white
        footerMoreLabel.text="更多"
        footerMoreLabel.textAlignment=NSTextAlignment.center
        footerMoreLabel.font=UIFont.boldSystemFont(ofSize: 16)
        footerMoreLabel.textColor=UIColor(red:87/255,green:202/255,blue:195/255,alpha:1.0)
        footerSectionView.addSubview(footerMoreLabel)
        footerLineView.frame=CGRect(x:0,y:0,width:screenw,height:0.5)
        footerLineView.backgroundColor=UIColor.lightGray
        footerSectionView.addSubview(footerLineView)
        
        //建立手势识别器
        let footerTapGesture = UITapGestureRecognizer(target: self, action: #selector(footerViewTapGesture))
        //附加识别器到视图
        footerSectionView.addGestureRecognizer(footerTapGesture)
        footerSectionView.tag=section+1000
        return footerSectionView
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

    func headerViewTapGesture(tap:UITapGestureRecognizer){
        print("点击了组头\(tap.view?.tag ?? 99)")
    }
    func footerViewTapGesture(tap:UITapGestureRecognizer){
        print("点击了组尾\(tap.view?.tag ?? 999)")
    }
    
    
    //懒加载
//    lazy var headerSectionView:UIView = {
//        () ->UIView in
//        let headerView=UIView()
//        return headerView
//    }()
//
//    lazy var headerTitleLabel:UILabel = {
//        () ->UILabel in
//        let titleLabel=UILabel()
//        return titleLabel
//    }()
//
//    lazy var headerLineView:UIView = {
//        () ->UIView in
//        return UILabel()
//    }()
//
//    lazy var footerSectionView:UIView = {
//        () -> UIView in
//        let footerView=UIView()
//        return footerView
//    }()
//
    
    
    @IBOutlet weak var orderTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        arrData=[["totalPrice":"45","orderTime" :"2017-09-08 12：00" ,"shopInfo" :"香禾米线" ],["totalPrice":"15" ,"orderTime" :"2017-09-10 12:23" ,"shopInfo" :"柳州螺蛳粉" ],["totalPrice":"22" ,"orderTime" :"2017-09-09 10：22" ,"shopInfo" :"铜锣湾米线" ],["totalPrice":"4","orderTime" :"2017-09-08 12：00" ,"shopInfo" :"香禾米线" ],["totalPrice":"115" ,"orderTime" :"2017-09-10 12:23" ,"shopInfo" :"柳州螺蛳粉" ],["totalPrice":"202" ,"orderTime" :"2017-09-09 10：22" ,"shopInfo" :"铜锣湾米线" ],["totalPrice":"435","orderTime" :"2017-09-08 12：00" ,"shopInfo" :"香禾米线" ],["totalPrice":"15" ,"orderTime" :"2017-09-10 12:23" ,"shopInfo" :"柳州螺蛳粉" ]]
        
        titleArr=["我的订单","我的收藏","最近浏览","我的喜欢"]
       _loadInitView()
        // Do any additional setup after loading the view.
    }

    //加载view
    func _loadInitView(){
        self.orderTableView.dataSource=self
        self.orderTableView.delegate=self
//        self.orderTableView.tableFooterView=UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //去掉组头组尾悬浮
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = self.orderTableView.contentOffset.y
//        let sectionHeaderHeight:CGFloat = 50
//        let sectionFooterHeight:CGFloat = 55
//        if offsetY >= 0 &&  offsetY <= sectionHeaderHeight {
//            self.orderTableView.contentInset = UIEdgeInsetsMake(-offsetY, 0, -sectionFooterHeight, 0)
//        }else if (offsetY >= sectionHeaderHeight && offsetY <= self.orderTableView.contentSize.height-self.orderTableView.frame.size.height-sectionFooterHeight){
//            self.orderTableView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, -sectionFooterHeight, 0)
//        }else if (offsetY >= self.orderTableView.contentSize.height-self.orderTableView.frame.size.height-sectionFooterHeight && offsetY <= self.orderTableView.contentSize.height-self.orderTableView.frame.size.height){
//            self.orderTableView.contentInset = UIEdgeInsetsMake(-offsetY, 0, -(self.orderTableView.contentSize.height-self.orderTableView.frame.size.height-sectionFooterHeight), 0)
//        }
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
