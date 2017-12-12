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
    var arrData2:Array<Any> = []
    var titleArr:Array<Any> = []
    let screenh = UIScreen.main.bounds.size.height//整个屏幕的高
    let screenw = UIScreen.main.bounds.size.width//整个屏幕的宽
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arrData.count
        }else if(section == 1 ){
            return arrData2.count
            }
        else {
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
            cell.evaluateButton.addTarget(self, action: #selector(ClickEvaluateButtonAction), for: UIControlEvents.touchUpInside)
            cell.evaluateButton.tag=10+indexPath.row
            return cell
        }else {
            let  cell:myCollectionTabCell
                = tableView.dequeueReusableCell(withIdentifier: "myCollectionTabCellID") as! myCollectionTabCell
            cell.backgroundColor=UIColor.white
            cell.ratingScoreBarView.isIndicator = true
//            cell._loadCellData(dic: arrData[indexPath.row] as! NSDictionary)

            return cell
            
            
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let oneVC = storyboard.instantiateViewController(withIdentifier: "ViewControllerID") as! ViewController
            self.navigationController?.pushViewController(oneVC, animated: true)
        }else
        {
            let storyboard = UIStoryboard(name: "home", bundle: nil)
            let typeVC = storyboard.instantiateViewController(withIdentifier: "typeViewControllerID") as! typeViewController
            self.navigationController?.pushViewController(typeVC, animated: true)
        }
       
    }
    

    
    //MARK:-----删除+移动
    

    
    //是否有删除功能
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)
        -> UITableViewCellEditingStyle
    {
        if(orderTableView.isEditing == false){
            return UITableViewCellEditingStyle.none
        }else{
            return UITableViewCellEditingStyle.delete
        }
    }
    
    //删除提示
    func tableView(_ tableView: UITableView,
                   titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath)
        -> String? {
            return "确定删除？"
    }
    
    //编辑完毕（这里只有删除操作）
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCellEditingStyle,
                   forRowAt indexPath: IndexPath) {
            if(editingStyle == UITableViewCellEditingStyle.delete)
            {
                arrData.remove(at: (indexPath as NSIndexPath).row)
                orderTableView.reloadData()
                print("你确认了删除按钮")
            }
       
    }
    
    //在编辑状态，可以拖动设置cell位置
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
            return true
    }
    
    //移动cell事件
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath,
                   to toIndexPath: IndexPath) {
      
        if fromIndexPath != toIndexPath{
            //获取移动行对应的值
//            let itemValue:ListItem = listItems[(fromIndexPath as NSIndexPath).row]
            //删除移动的值
            arrData.remove(at: (fromIndexPath as NSIndexPath).row)
            //如果移动区域大于现有行数，直接在最后添加移动的值
            if (toIndexPath as NSIndexPath).row > arrData.count{
                arrData.append(["totalPrice":"45","orderTime" :"2017-09-08 12：00" ,"shopInfo" :"香禾米线" ])
            }else{
                //没有超过最大行数，则在目标位置添加刚才删除的值
                arrData.insert(["totalPrice":"45","orderTime" :"2017-09-08 12：00" ,"shopInfo" :"香禾米线" ], at:(toIndexPath as NSIndexPath).row)
            }
        }
    }
    //MARK:---删除cell结束
    
 
    
    
    func headerViewTapGesture(tap:UITapGestureRecognizer){
        print("点击了组头\(tap.view?.tag ?? 99)")
    }
    func footerViewTapGesture(tap:UITapGestureRecognizer){
        print("点击了组尾\(tap.view?.tag ?? 999)")
        if tap.view?.tag == 1000 {
           arrData=[["totalPrice":"45","orderTime" :"2017-09-08 12：00" ,"shopInfo" :"香禾米线" ],["totalPrice":"15" ,"orderTime" :"2017-09-10 12:23" ,"shopInfo" :"柳州螺蛳粉" ],["totalPrice":"22" ,"orderTime" :"2017-09-09 10：22" ,"shopInfo" :"铜锣湾米线" ],["totalPrice":"4","orderTime" :"2017-09-08 12：00" ,"shopInfo" :"香禾米线" ],["totalPrice":"115" ,"orderTime" :"2017-09-10 12:23" ,"shopInfo" :"柳州螺蛳粉" ],["totalPrice":"202" ,"orderTime" :"2017-09-09 10：22" ,"shopInfo" :"铜锣湾米线" ],["totalPrice":"435","orderTime" :"2017-09-08 12：00" ,"shopInfo" :"香禾米线" ],["totalPrice":"15" ,"orderTime" :"2017-09-10 12:23" ,"shopInfo" :"柳州螺蛳粉" ]]
            self.orderTableView.reloadSections([0], with: .fade)

        }else if(tap.view?.tag == 1001){
//        arrData2=[["totalPrice":"45","orderTime" :"2017-09-08 12：00" ,"shopInfo" :"香禾米线" ],["totalPrice":"15" ,"orderTime" :"2017-09-10 12:23" ,"shopInfo" :"柳州螺蛳粉" ],["totalPrice":"22" ,"orderTime" :"2017-09-09 10：22" ,"shopInfo" :"铜锣湾米线" ],["totalPrice":"4","orderTime" :"2017-09-08 12：00" ,"shopInfo" :"香禾米线" ]]
//        self.orderTableView.reloadSections([1], with: .fade)

    }
//        let indexPath: IndexPath = IndexPath.init(row: 1, section: 0)
//        self.orderTableView.reloadRows(at: [indexPath], with: .fade)
        // 刷新第几组，直接传入要刷新的组数集合 “[section]”
//        self.orderTableView.reloadSections([0,1,2,3], with: .fade)
//        self.orderTableView.reloadData()
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
        
        
        arrData=[["totalPrice":"45","orderTime" :"2017-09-08 12：00" ,"shopInfo" :"香禾米线" ],["totalPrice":"15" ,"orderTime" :"2017-09-10 12:23" ,"shopInfo" :"柳州螺蛳粉" ],["totalPrice":"22" ,"orderTime" :"2017-09-09 10：22" ,"shopInfo" :"铜锣湾米线" ]]
        arrData2=[["totalPrice":"45","orderTime" :"2017-09-08 12：00" ,"shopInfo" :"香禾米线" ],["totalPrice":"15" ,"orderTime" :"2017-09-10 12:23" ,"shopInfo" :"柳州螺蛳粉" ]]
        
        titleArr=["我的订单","我的收藏","最近浏览","我的喜欢"]
       _loadInitView()
        // Do any additional setup after loading the view.
   
    
      print("系统高：\(screenHeight)")
//      self.view.backgroundColor=owerRandomColorAlpha(R:255,G:255,B:255,A:1.0)

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

    
    
    
    //按钮响应事件
    func ClickEvaluateButtonAction(button:UIButton){
         button.superview!.animateWhenClicked()
        let myView = Bundle.main.loadNibNamed("ActivityAlertView", owner: nil, options: nil)?.first as? ActivityAlertView
        myView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        myView?.center = self.view.center
        let mydic = arrData[button.tag-10] as! NSDictionary
        print(arrData[button.tag-10])
        myView?.shopNamelabel.text = mydic["shopInfo"] as? String
        myView?.jianStringPT = "满减"
        if myView != nil {
            self.view.addSubview(myView!)
        }

    }
    
//    func myclicked(sender: UIButton) {
//        sender.superview!.animateWhenClicked()
//    }
    
    
  
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    //编辑列表
    @IBAction func editBtn(_ sender: UIButton) {
        
        //在正常状态和编辑状态之间切换
        if(orderTableView.isEditing == false){
            orderTableView.setEditing(true, animated:true)
            sender.setTitle("保存", for: UIControlState.normal)
        }
        else{
            orderTableView.setEditing(false, animated:true)
            sender.setTitle("编辑", for: UIControlState.normal)

        }
        //重新加载表数据（改变单元格输入框编辑/只读状态）
        orderTableView.reloadData()

    }
    
    
    
}



extension UIView {
    func animateWhenClicked() {
        self.backgroundColor = UIColor(white: 0.9, alpha: 0.5)
        self.layer.transform = CATransform3DMakeScale(1, 1, 0)
        UIView.animate(withDuration: 0.9, animations: {
            self.backgroundColor = UIColor.white
            self.layer.transform = CATransform3DMakeTranslation(1, 1, 1)
        })
    }
}

