//
//  typeViewController.swift
//  swiftTry
//
//  Created by nhl on 2017/9/21.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit

class typeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var dataArr:Array<Any> = []
    var dataArr2:Array<Any> = []

    var titleArr:Array<Any> = []
    var picColorArr:Array<UIColor> = []

    let screenh = UIScreen.main.bounds.size.height//整个屏幕的高
    
    let screenw = UIScreen.main.bounds.size.width//整个屏幕的宽
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section==0 {
            return dataArr.count
        }else
        {
            return dataArr2.count

        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return titleArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
             return CGSize(width:(self.screenw-40)/2,height:(self.screenw-40)/3+40)
        }else if(indexPath.section == 2){
            return CGSize(width:(self.screenw-40),height:(self.screenw-40)/3+40)
        }else if(indexPath.section == 3){
            return CGSize(width:(self.screenw-40)/5,height:(self.screenw-40)/4+40)
        }
        else {
            return CGSize(width:(self.screenw-40)/3,height:(self.screenw-40)/3+40)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width:screenw,height:50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:screenw,height:50)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionView:UICollectionReusableView=UICollectionReusableView()
        if kind == UICollectionElementKindSectionFooter  {
         let sectionFooterView:typeFooterCollReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "typeSectionFooterViewID", for: indexPath) as! typeFooterCollReusableView
            sectionFooterView.lineView.frame=CGRect(x:0,y:0,width:screenw,height:0.5)
            return sectionFooterView
        }else if(kind == UICollectionElementKindSectionHeader){
         
            let sectionHeadView:typeHeaderCollReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "typeSectionHeaderViewID", for: indexPath) as! typeHeaderCollReusableView
            sectionHeadView.lineView.frame=CGRect(x:0,y:49.5,width:screenw,height:0.5)
            sectionHeadView.titleLabel.text=titleArr[indexPath.section] as? String
            if indexPath.section == 0{
                sectionHeadView.clickButton.isHidden=false
            }else
            {
                sectionHeadView.clickButton.isHidden=true
            }
            return sectionHeadView
        }else{
            return sectionView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell:likeCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "likeCollectionCellID", for: indexPath) as! likeCollectionCell
        if indexPath.section == 0 {
        cell.titleLabel.text=dataArr[indexPath.row] as? String
        }else
        {
        cell.titleLabel.text=dataArr2[indexPath.row] as? String
        }
        cell.picImageView.backgroundColor=picColorArr[indexPath.section]
        
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

    @IBOutlet weak var typeCollectionView: UICollectionView!
    
    @IBOutlet weak var typeCollectionViewFlowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr=["天天口语","段子来了","明朝那些事儿","夜色钢琴曲儿","读者(人文)","郭德纲相声十年经典"]
        dataArr2=["魔道祖师","全职高手","白夜行","解忧杂货店"]
        titleArr=["猜你喜欢","最近浏览","热销书籍","精品听单","综艺娱乐"]
        picColorArr=[UIColor.purple,UIColor.blue,UIColor.orange,UIColor.green,UIColor.brown]
        self.typeCollectionView.delegate=self
        self.typeCollectionView.dataSource=self
//        self.typeCollectionViewFlowLayout.itemSize = CGSize(width:(screenw-40)/3,height:(screenw-40)/3+40)
        self.typeCollectionViewFlowLayout.minimumLineSpacing=10
        self.typeCollectionViewFlowLayout.minimumInteritemSpacing=10
        self.typeCollectionViewFlowLayout.sectionInset = UIEdgeInsets(top:10,left:10,bottom:10,right:10)
//        self.typeCollectionView.register(UINib.init(nibName:"typeFooterCollReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "typeSectionFooterViewID")
//         self.typeCollectionView.register(UINib.init(nibName:"typeHeaderCollReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "typeSectionHeaderViewID")

      
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

}
