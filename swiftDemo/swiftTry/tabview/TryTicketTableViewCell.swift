//
//  TryTicketTableViewCell.swift
//  swiftTry
//
//  Created by nhl on 2017/12/12.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit

class TryTicketTableViewCell: UITableViewCell {
    @IBOutlet weak var lookCodeButton: UIButton!//

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lookCodeButton.layer.borderWidth=2
        lookCodeButton.layer.borderColor=UIColor.init(red: 63/255, green: 129/255, blue: 103/255, alpha: 1).cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
