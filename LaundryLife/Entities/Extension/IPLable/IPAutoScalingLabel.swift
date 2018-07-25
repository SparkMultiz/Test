//
//  Created by Chirag Patel on 7/21/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//


import UIKit

class IPAutoScalingLabel: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        //print("required init")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //print("override init")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        autoscalingSizeOflable()
    }
    
    func autoscalingSizeOflable (){
        self.font = self.font.withSize(((UIScreen.main.bounds.size.width) * self.font.pointSize) / 320)
    }
}
