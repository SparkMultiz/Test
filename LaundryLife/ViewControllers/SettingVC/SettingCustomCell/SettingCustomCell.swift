//
//  SettingCustomCell.swift
//  LaundryLife
//
//  Created by Chirag Patel on 7/24/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//

import UIKit

class SettingCustomCell: UITableViewCell {
    @IBOutlet weak var imgRightBarSettings: UIImageView!
    
    @IBOutlet weak var lblSettingsDiscription: IPAutoScalingLabel!
    @IBOutlet weak var lblSettingsName: IPAutoScalingLabel!
    @IBOutlet weak var ImgSettings: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
