//
//  typeViewController.swift
//  swiftTry
//
//  Created by nhl on 2017/9/21.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit

class typeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,SliderGalleryControllerDelegate {
    var dataArr:Array<Any> = []
    var dataArr2:Array<Any> = []
    var dataArr3:Array<Any> = []

    var titleArr:Array<Any> = []
    var picColorArr:Array<UIColor> = []

    let screenh = UIScreen.main.bounds.size.height//整个屏幕的高
    
    let screenw = UIScreen.main.bounds.size.width//整个屏幕的宽
    //获取屏幕宽度
    let screenWidth =  UIScreen.main.bounds.size.width
    
    //图片轮播组件
    var sliderGallery : SliderGalleryController!
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section==0 {
            return dataArr.count
        }else if(section == 1){
            return dataArr2.count
        }
        else
        {
            return dataArr3.count

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
            return CGSize(width:(self.screenw-40)/3-1,height:(self.screenw-40)/3+40)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width:screenw,height:50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            
            return CGSize(width:screenw,height:200)
            
        }else
        {
            return CGSize(width:screenw,height:50)
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top:10,left:10,bottom:10,right:10)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
      
        let sectionView:UICollectionReusableView=UICollectionReusableView()
      
        if kind == UICollectionElementKindSectionFooter  {
         let sectionFooterView:typeFooterCollReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "typeSectionFooterViewID", for: indexPath) as! typeFooterCollReusableView
            sectionFooterView.lineView.frame=CGRect(x:0,y:0,width:screenw,height:0.5)
            sectionFooterView.hypButton.addTarget(self, action: #selector(huanYiPiButtonAction), for: UIControlEvents.touchUpInside)
            sectionFooterView.hypButton.tag=indexPath.section+200
            return sectionFooterView
        }else if(kind == UICollectionElementKindSectionHeader){
         
            let sectionHeadView:typeHeaderCollReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "typeSectionHeaderViewID", for: indexPath) as! typeHeaderCollReusableView
            sectionHeadView.titleLabel.text=titleArr[indexPath.section] as? String
            if indexPath.section == 0{
                sectionHeadView.clickButton.isHidden=false
                sectionHeadView.bgLBView.isHidden=false
                sectionHeadView.titleView.frame=CGRect(x:0,y:150,width:screenw,height:50)
                sectionHeadView.lineView.frame=CGRect(x:0,y:49.5,width:screenw,height:0.5)

                //初始化图片轮播组件
                sliderGallery = SliderGalleryController()
                sliderGallery.delegate = self
                sliderGallery.view.frame = CGRect(x:0,y:0,width:screenw,height:150);
                
                //将图片轮播组件添加到当前视图
                self.addChildViewController(sliderGallery)
                sectionHeadView.bgLBView.addSubview(sliderGallery.view)
                
                //添加组件的点击事件
                let tap = UITapGestureRecognizer(target: self,
                                                 action: #selector(typeViewController.handleTapAction(_:)))
                sliderGallery.view.addGestureRecognizer(tap)
            }else
            {
                sectionHeadView.clickButton.isHidden=true
                sectionHeadView.bgLBView.isHidden=true
                sectionHeadView.titleView.frame=CGRect(x:0,y:0,width:screenw,height:50)
                sectionHeadView.lineView.frame=CGRect(x:0,y:49.5,width:screenw,height:0.5)

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
        }else if(indexPath.section==1){
        cell.titleLabel.text=dataArr2[indexPath.row] as? String
        }
        else
        {
        cell.titleLabel.text=dataArr3[indexPath.row] as? String
        }
        cell.picImageView.backgroundColor=picColorArr[indexPath.section]
        
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let horiVC = UIStoryboard(name:"home",bundle:nil).instantiateViewController(withIdentifier: "horizontalScrollingVCID") as! horizontalScrollingVC
        self.navigationController?.pushViewController(horiVC, animated: true)
    }

    @IBOutlet weak var typeCollectionView: UICollectionView!
    
    @IBOutlet weak var typeCollectionViewFlowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr=["天天口语","段子来了","明朝那些事儿","夜色钢琴曲儿","读者(人文)","郭德纲相声十年经典"]
        dataArr2=["魔道祖师","全职高手"]
        dataArr3=["魔道祖师","全职高手","白夜行"]
        titleArr=["猜你喜欢","最近浏览","热销书籍","精品听单","综艺娱乐"]
       picColorArr=[UIColor.purple,UIColor.blue,UIColor.orange,UIColor.green,UIColor.brown]
       
        self._initViewUI()
        
        
        
       
        // Do any additional setup after loading the view.
    }

    func _initViewUI() {
        self._initCollectionUI()
        self._initScrollViewUI()
    }
    
    func _initCollectionUI(){
        self.typeCollectionView.delegate=self
        self.typeCollectionView.dataSource=self
        //        self.typeCollectionViewFlowLayout.itemSize = CGSize(width:(screenw-40)/3,height:(screenw-40)/3+40)
        self.typeCollectionViewFlowLayout.minimumLineSpacing=10
        self.typeCollectionViewFlowLayout.minimumInteritemSpacing=10
        //        self.typeCollectionViewFlowLayout.sectionInset = UIEdgeInsets(top:10,left:10,bottom:10,right:10)
   
    }
    
    func _initScrollViewUI() {
//        //初始化图片轮播组件
//        sliderGallery = SliderGalleryController()
//        sliderGallery.delegate = self
//        sliderGallery.view.frame = CGRect(x:0,y:0,width:screenw,height:150);
//
//        //将图片轮播组件添加到当前视图
//        self.addChildViewController(sliderGallery)
//        self.bgLBView.addSubview(sliderGallery.view)
//
//        //添加组件的点击事件
//        let tap = UITapGestureRecognizer(target: self,
//                                         action: #selector(typeViewController.handleTapAction(_:)))
//        sliderGallery.view.addGestureRecognizer(tap)
    }
    
    func huanYiPiButtonAction(button:UIButton) {
        print(button.tag-200)
        if button.tag-200 == 1  {
            dataArr2=["魔道祖师","全职高手","白夜行","解忧杂货店","我不喜欢全世界我只喜欢你","朝花夕拾","快把我哥带走"]
            self.typeCollectionView.reloadSections([1])
        }
//        self.typeCollectionView.reloadData()
//        self.typeCollectionView.reloadSections([(section:button.tag-200) as! Int])
    }
    
    //图片轮播组件协议方法：获取内部scrollView尺寸
    func galleryScrollerViewSize() -> CGSize {
        return CGSize(width: screenWidth, height:150)
    }

    //图片轮播组件协议方法：获取数据集合
    func galleryDataSource() -> [String] {
        return ["https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4278045673,1225611433&fm=27&gp=0.jpg",
                "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1729574112,1149336453&fm=27&gp=0.jpg",
                "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1490267196,968967990&fm=27&gp=0.jpg",
                "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=731229049,139289674&fm=27&gp=0.jpg"]
    }

    //点击事件响应
    func handleTapAction(_ tap:UITapGestureRecognizer)->Void{
        //获取图片索引值
        let index = sliderGallery.currentIndex
        //弹出索引信息
        let alertController = UIAlertController(title: "您点击的图片索引是：",
                                                message: "\(index)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
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
