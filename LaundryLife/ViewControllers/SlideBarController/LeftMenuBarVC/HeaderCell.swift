//
//  HeaderCell.swift
//  KoloniKube_Swift
//
//  Created by Tops on 5/1/18.
//  Copyright © 2018 Self. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var btnProfileClick: UIButton!
    @IBOutlet weak var lblCalories: IPAutoScalingLabel!
    @IBOutlet weak var lblRideRate: IPAutoScalingLabel!
    @IBOutlet weak var lblMiles: IPAutoScalingLabel!
    @IBOutlet weak var lblEditProfileIcon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
