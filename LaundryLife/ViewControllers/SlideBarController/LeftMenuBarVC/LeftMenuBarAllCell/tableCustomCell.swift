//
//  tableCustomCell.swift
//  KoloniKube_Swift
//
//  Created by Tops on 5/1/18.
//  Copyright © 2018 Self. All rights reserved.
//

import UIKit

class tableCustomCell: UITableViewCell {
    @IBOutlet weak var lblControllerName: UILabel!
    @IBOutlet weak var imgMenu: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
