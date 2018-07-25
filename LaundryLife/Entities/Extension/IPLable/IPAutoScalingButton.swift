//
//  Created by Chirag Patel on 7/21/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//

import UIKit

class IPAutoScalingButton: UIButton {
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
        //print("awakeFromNib")
        //print("\(String(describing: self.titleLabel?.font.pointSize))")
        autoscalingSizeOflable()
        //print("\(String(describing: self.titleLabel?.font.pointSize))")
    }
    
    func autoscalingSizeOflable (){
        self.titleLabel?.font = self.titleLabel?.font.withSize(((UIScreen.main.bounds.size.width) * (self.titleLabel?.font.pointSize)!) / 320)
    }
}

class IPAutoScalingTextField: UITextField {
    override var placeholder: String? {
        didSet {
            let placeholderString = NSAttributedString(string: placeholder!, attributes: [NSAttributedStringKey.foregroundColor: Global.kAppColor.SecondaryWightF1E])
            self.attributedPlaceholder = placeholderString
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //print("awakeFromNib")
        print("\(String(describing: self.font?.pointSize))")
        autoscalingSizeOflable()
        print("\(String(describing: self.font?.pointSize))")
    }
    
    func autoscalingSizeOflable (){
        self.font = self.font?.withSize(((UIScreen.main.bounds.size.width) * (self.font?.pointSize)!) / 320)
    }
}

