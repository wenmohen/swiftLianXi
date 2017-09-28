//
//  OrderTableViewCell.swift
//  swiftTry
//
//  Created by nhl on 2017/9/21.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var evaluateButton: baseButton!//评价
    @IBOutlet weak var oneMoreButton: baseButton!//再来一单
    @IBOutlet weak var totalPriceLabel: UILabel!//总价
    @IBOutlet weak var orderTimeLabel: UILabel!//下单时间
    @IBOutlet weak var shopInfoLaebl: UILabel!//商家店名
    @IBOutlet weak var waitEvaluateLabel: UILabel!//待评价
    @IBOutlet weak var shopPicImageView: UIImageView!//商家logo
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func _loadCellData(dic:NSDictionary){
        self.totalPriceLabel.text="总价：￥" + String(describing: dic["totalPrice"] ?? "")
//        self.orderTimeLabel.text="下单时间：" + String(describing: dic["orderTime"] ?? "")
        self.orderTimeLabel.text="下单时间：" + (dic["orderTime"] as? String)!
        self.shopInfoLaebl.text = (dic["shopInfo"] as? String)! + "(" + "拱北店" + ")"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
