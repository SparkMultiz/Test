//
//  GenericValidation.swift
//  LaundryLife
//
//  Created by Chirag Patel on 7/21/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//

import UIKit

class GenericValidation: NSObject {
    
    func checkLoginValidation(strEmail:String, strPassword:String) {
        
        guard strEmail.count > 0 else {
            Singleton.sharedSingleton.showWarningAlert(withMsg: "Please enter Email Id")
            return
        }
        guard strEmail.isEmail else {
            Singleton.sharedSingleton.showWarningAlert(withMsg: "Please enter valid Email Id")
            return
        }
        guard strPassword.count > 0 else {
            Singleton.sharedSingleton.showWarningAlert(withMsg: "Please enter password")
            return
        }
        
    }
}


class GenericViewLayout : UIView {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ViewLayoutSetupGenericMethod()
    }
    
    func ViewLayoutSetupGenericMethod() {
        self.layer.borderWidth = 1
        self.layer.borderColor = Global.kAppColor.LightColor.cgColor
        self.layer.cornerRadius = 5.0
        
    }
}

