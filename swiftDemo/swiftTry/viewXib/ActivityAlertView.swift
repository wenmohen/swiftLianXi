//
//  ShopActivityView.swift
//  iFoodMacau-Delivery
//
//  Created by nhl on 2017/9/18.
//  Copyright © 2017年 Supernova Software. All rights reserved.
//

import UIKit


class ActivityAlertView: UIView {
    
    let alertLabelColor=UIColor.white//字体颜色
    
    let alertLabelFont=UIFont.systemFont(ofSize: 12)//字体大小
    
    let screenh = UIScreen.main.bounds.size.height//整个屏幕的高
    
    let screenw = UIScreen.main.bounds.size.width//整个屏幕的宽
    
    @IBOutlet weak var activityMiddleView: UIView!//除了头部view外代码布局的部分view
    
    @IBOutlet weak var closeBtn: UIButton!//底部关闭按钮
    
    @IBOutlet weak var bgScrollView: UIScrollView!//整个弹出框的背景scrollview
    
    @IBOutlet weak var headImageView: UIImageView!//头像imageview
    
    @IBOutlet weak var shopNamelabel: UILabel!//店名
    
    @IBOutlet weak var startView: RatingBar!//星星评分view
    
    @IBOutlet weak var scoreLabel: UILabel!//评价分数
    
    @IBOutlet weak var deliveryTimeLabel: UILabel!//配送时间
    
    @IBOutlet weak var deliveryInfoLabel: UILabel!//配送信息（起送、配送费、时长）
    
    let blurView = UIVisualEffectView()//毛玻璃背景
    
    var jianStringPT:String!//传值测试（可删除）
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        
        //首先创建一个模糊效果
        let blurEffect = UIBlurEffect(style: .dark)
        //接着创建一个承载模糊效果的视图
        blurView.effect = blurEffect
        // 设置模糊视图的大小（全屏）
        blurView.frame.size = CGSize(width: self.bgScrollView.frame.width, height: self.bgScrollView.frame.height)
        self.bgScrollView.insertSubview(blurView, at: 0)
        self.bgScrollView.backgroundColor=UIColor.clear
        
        
        
        //初始化页面及给页面数据赋值
        self.startView.isIndicator=true //设置星星评分条为不可手动滑动改变分数
        self.startView.numStars=5
        self.startView.ratingMax=5
        self.startView.rating = 3.8
        self.scoreLabel.text = "3.8"
//        self.shopNamelabel.text="乡雅菜馆（拱北店）"
        self.deliveryInfoLabel.text="起送 ￥"+"23"+" | 配送 ￥"+"2.5"+" | "+"30"+"分钟"
        self.deliveryTimeLabel.text="配送时间："+"09：39-11:00"
        
        _initAlertView(jianString: jianStringPT, zheString: "折扣商品3.8折起", shouString: "新用户立减11元,首次使用银行卡支付最高再减3元", zengString: "本店有赠品", gongGaoString: "为了适应苏宁易购平台发展，现对发货规则进行修订，原发货时效要求：72h内发货更后：48h内发货，系统针对延迟发货会进行自动扣分处罚平台要求商家48小时内进行发货（定制、预售及其他特殊情形另行约定发货时间的除外,原发货时效要求：72h内发货更后：48h内发货，系统针对延迟发货会进行自动扣分处罚平台要求商家48小时内进行发货（定制、预售及其他特殊情形另行约定发货时间的除外）")
        
        
    }
    
    
    
    //初始化界面内容及数据
    func _initAlertView(jianString:String,zheString:String,shouString:String,zengString:String,gongGaoString:String){
        
        //减
        let jianTitleLabel=UILabel()
        jianTitleLabel.frame=CGRect(x:20,y:20,width:0,height:0)
        self.activityMiddleView.addSubview(jianTitleLabel)
        let jianLabel=UILabel()
        jianLabel.frame=CGRect(x:jianTitleLabel.frame.maxX+10,y:10,width:0,height:0)
        self.activityMiddleView.addSubview(jianLabel)
        if jianString.characters.count > 0 {
            jianTitleLabel.frame=CGRect(x:20,y:20,width:18,height:18)
            jianTitleLabel.contentMode = .scaleAspectFit
            jianTitleLabel.backgroundColor=UIColor .red
            jianTitleLabel.text="减"
            jianTitleLabel.textColor=alertLabelColor
            jianTitleLabel.textAlignment=NSTextAlignment.center
            jianTitleLabel.font=UIFont.systemFont(ofSize: 12)
            
            jianLabel.frame=CGRect(x:jianTitleLabel.frame.maxX+10,y:10,width:screenw-jianTitleLabel.frame.maxX-50,height:30)
            jianLabel.text=jianString
            jianLabel.textColor=alertLabelColor
            jianLabel.font=alertLabelFont
            autoLabel(laebl: jianLabel,lineHeight:6.00)
        }
        
        
        //折
        let zheTitleLabel=UILabel()
        zheTitleLabel.frame=CGRect(x:20,y:jianLabel.frame.maxY+10,width:0,height:0)
        self.activityMiddleView.addSubview(zheTitleLabel)
        
        let zheLabel=UILabel()
        zheLabel.frame=CGRect(x:zheTitleLabel.frame.maxX+10,y:jianLabel.frame.maxY,width:0,height:0)
        self.activityMiddleView.addSubview(zheLabel)
        if zheString.characters.count > 0 {
            zheTitleLabel.frame=CGRect(x:20,y:jianLabel.frame.maxY+10,width:18,height:18)
            zheTitleLabel.backgroundColor=UIColor .blue
            zheTitleLabel.text="折"
            zheTitleLabel.textColor=alertLabelColor
            zheTitleLabel.textAlignment=NSTextAlignment.center
            zheTitleLabel.font=UIFont.systemFont(ofSize: 12)
            self.activityMiddleView.addSubview(zheTitleLabel)
            
            zheLabel.frame=CGRect(x:zheTitleLabel.frame.maxX+10,y:jianLabel.frame.maxY,width:screenw-zheTitleLabel.frame.maxX-50,height:30)
            zheLabel.text=zheString
            zheLabel.textColor=alertLabelColor
            zheLabel.font=alertLabelFont
            autoLabel(laebl: zheLabel,lineHeight:6.00)
        }
        
        
        //首
        let shouTitleLabel=UILabel()
        shouTitleLabel.frame=CGRect(x:20,y:zheLabel.frame.maxY+10,width:0,height:0)
        self.activityMiddleView.addSubview(shouTitleLabel)
        let shouLabel=UILabel()
        shouLabel.frame=CGRect(x:shouTitleLabel.frame.maxX+10,y:zheLabel.frame.maxY,width:0,height:0)
        self.activityMiddleView.addSubview(shouLabel)
        if shouString.characters.count > 0 {
            shouTitleLabel.frame=CGRect(x:20,y:zheLabel.frame.maxY+10,width:18,height:18)
            shouTitleLabel.backgroundColor=UIColor .orange
            shouTitleLabel.text="首"
            shouTitleLabel.textColor=alertLabelColor
            shouTitleLabel.textAlignment=NSTextAlignment.center
            shouTitleLabel.font=UIFont.systemFont(ofSize: 12)
            
            shouLabel.frame=CGRect(x:shouTitleLabel.frame.maxX+10,y:zheLabel.frame.maxY,width:screenw-shouTitleLabel.frame.maxX-50,height:30)
            shouLabel.text=shouString
            shouLabel.textColor=alertLabelColor
            shouLabel.font=alertLabelFont
            autoLabel(laebl: shouLabel,lineHeight:6.00)
        }
        
        
        //赠
        let zengTitleLabel=UILabel()
        zengTitleLabel.frame=CGRect(x:20,y:shouLabel.frame.maxY+10,width:0,height:0)
        self.activityMiddleView.addSubview(zengTitleLabel)
        
        let zengLabel=UILabel()
        zengLabel.frame=CGRect(x:zengTitleLabel.frame.maxX+10,y:shouLabel.frame.maxY,width:0,height:0)
        self.activityMiddleView.addSubview(zengLabel)
        if zengString.characters.count > 0 {
            zengTitleLabel.frame=CGRect(x:20,y:shouLabel.frame.maxY+10,width:18,height:18)
            zengTitleLabel.backgroundColor=UIColor .purple
            zengTitleLabel.text="赠"
            zengTitleLabel.textColor=alertLabelColor
            zengTitleLabel.textAlignment=NSTextAlignment.center
            zengTitleLabel.font=UIFont.systemFont(ofSize: 12)
            
            zengLabel.frame=CGRect(x:zengTitleLabel.frame.maxX+10,y:shouLabel.frame.maxY,width:screenw-zengTitleLabel.frame.maxX-50,height:30)
            zengLabel.text=zengString
            zengLabel.textColor=alertLabelColor
            zengLabel.font=alertLabelFont
            autoLabel(laebl: zengLabel,lineHeight:6.00)
        }
        
        
        
        //线
        let lineView=UIView()
        lineView.frame=CGRect(x:20,y:zengLabel.frame.maxY+10,width:0,height:0)
        self.activityMiddleView.addSubview(lineView)
        let gongGaoTitleLabel=UILabel()
        gongGaoTitleLabel.frame=CGRect(x:20,y:lineView.frame.maxY,width:0,height:0)
        self.activityMiddleView.addSubview(gongGaoTitleLabel)
        let gongGaoLabel=UILabel()
        gongGaoLabel.frame=CGRect(x:20,y:gongGaoTitleLabel.frame.maxY,width:0,height:0)
        self.activityMiddleView.addSubview(gongGaoLabel)
        if gongGaoString.characters.count > 0 {
            if jianString.characters.count > 0 || zheString.characters.count > 0 || shouString.characters.count > 0 || zengString.characters.count > 0{
                lineView.frame=CGRect(x:20,y:zengLabel.frame.maxY+10,width:screenw-40-30,height:0.5)
                lineView.backgroundColor=UIColor.lightGray
            }
            
            //商家公告
        gongGaoTitleLabel.frame=CGRect(x:20,y:lineView.frame.maxY,width:screenw-40-40,height:50)
        gongGaoTitleLabel.text="商家公告"
        gongGaoTitleLabel.textColor=alertLabelColor
        gongGaoTitleLabel.font=UIFont.systemFont(ofSize: 20)
        gongGaoTitleLabel.numberOfLines=1
        gongGaoTitleLabel.textAlignment=NSTextAlignment.center
        gongGaoTitleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        gongGaoLabel.frame=CGRect(x:20,y:gongGaoTitleLabel.frame.maxY,width:screenw-40-40,height:30)
        gongGaoLabel.text=gongGaoString
        gongGaoLabel.textColor=alertLabelColor
        gongGaoLabel.font=UIFont.systemFont(ofSize: 14)
        autoLabel(laebl: gongGaoLabel,lineHeight:8.00)
        }
        
        
        //设置scrollview背景及滑动高度、内容大小
        self.bgScrollView.contentSize = CGSize(width: screenw-40, height: gongGaoLabel.frame.maxY+250)
        
        //scrollview背景毛玻璃效果，设置模糊视图的大小（全屏）
        if gongGaoLabel.frame.maxY+250 > self.bgScrollView.frame.height {
            blurView.frame.size = CGSize(width: self.bgScrollView.frame.width, height: gongGaoLabel.frame.maxY+250)
        }else{
            blurView.frame.size = CGSize(width: self.bgScrollView.frame.width, height: self.bgScrollView.frame.height)
        }
    }
    
    
    
    
    //加载自适应label
    func autoLabel(laebl:UILabel,lineHeight:CGFloat){
        laebl.numberOfLines=0
        laebl.lineBreakMode = NSLineBreakMode.byWordWrapping
        let text:String = laebl.text!//获取label的text
        laebl.attributedText = self .getAttributeStringWithString(text, lineSpace: lineHeight)
        let fontSize = CGSize(width: laebl.frame.width, height: laebl.font.lineHeight)
        let rect:CGSize = text.boundingRect(with: fontSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: laebl.font], context: nil).size;
        laebl.frame = CGRect(x:laebl.frame.origin.x,y:laebl.frame.origin.y+12,width: rect.width, height: rect.height)
        laebl.sizeToFit()
    }
    
    //设置行间距
    fileprivate func getAttributeStringWithString(_ string: String,lineSpace:CGFloat
        ) -> NSAttributedString{
        let attributedString = NSMutableAttributedString(string: string)
        let paragraphStye = NSMutableParagraphStyle()
        
        //调整行间距
        paragraphStye.lineSpacing = lineSpace
        let rang = NSMakeRange(0, CFStringGetLength(string as CFString!))
        attributedString .addAttribute(NSParagraphStyleAttributeName, value: paragraphStye, range: rang)
        return attributedString
    }
    
    
    ///label高度自适应
    ///
    /// - Parameters:
    ///   - text: 文字
    ///   - labelWidth: 最大宽度
    ///   - attributes: 字体，行距等
    /// - Returns: 高度
    func autoLabelHeight(with text:String , labelWidth: CGFloat ,attributes : [String : Any]) -> CGFloat{
        var size = CGRect()
        let size2 = CGSize(width: labelWidth, height: 0)//设置label的最大宽度
        size = text.boundingRect(with: size2, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes , context: nil);
        return size.size.height
    }
    
    
    //关闭按钮的点击事件
    @IBAction func closeBtnAction(_ sender: Any) {
        self.isHidden=true//点击关闭隐藏view，由于目前不能只刷新数据，建议每次移除view再重新初始化页面并赋值
        
    }
}
