//
//  horizontalScrollingVC.swift
//  swiftTry
//
//  Created by nhl on 2017/9/22.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit

class horizontalScrollingVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataArr.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:horizontalScrollingCollCell = collectionView.dequeueReusableCell(withReuseIdentifier: "horizontalScrollingCollCellID", for: indexPath) as! horizontalScrollingCollCell
        return cell
    }
    
    var dataArr:Array<Any> = []

    @IBOutlet weak var horizonCollectionView: UICollectionView!
    
    @IBOutlet weak var horizonCollectionViewFlowLayout: UICollectionViewFlowLayout!
    
    
    @IBOutlet weak var hScrollView: UIScrollView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr=["","","","","","","","","","","","",""]
        self.horizonCollectionView.delegate=self
        self.horizonCollectionView.dataSource=self
        self.horizonCollectionViewFlowLayout.itemSize=CGSize(width:screenWidth/4,height:screenWidth/4)
        _initHorScrollView()

        // Do any additional setup after loading the view.
    }

    func _initHorScrollView()  {
        
        for i in 0..<dataArr.count {
            let typeBtn:UIButton=UIButton()
            typeBtn.frame=CGRect(x:12+(i/4)*Int((screenWidth-24)/4),y:10+65*((i%4)),width:Int((screenWidth-24)/4-5),height:60 )
            typeBtn.backgroundColor=UIColor.white
            self.hScrollView.addSubview(typeBtn)
        }
self.hScrollView.contentSize=CGSize(width:screenWidth,height:self.hScrollView.frame.height)

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
