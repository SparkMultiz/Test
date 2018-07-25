//
//  ForgotPasswordVC.swift
//  LaundryLife
//
//  Created by Chirag Patel on 7/21/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var txtVerificationCode: IPAutoScalingTextField!
    @IBOutlet weak var txtEmail: IPAutoScalingTextField!
    @IBOutlet weak var txtNewPassword: IPAutoScalingTextField!
    @IBOutlet weak var txtConfirmNewPassword: IPAutoScalingTextField!
    @IBOutlet weak var btnReset: IPAutoScalingButton!
    @IBOutlet weak var btnBack: IPAutoScalingButton!
    @IBOutlet weak var InnerForgotView: UIView!
    @IBOutlet weak var InnerHeightViewContant: NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        InnerForgotView.isHidden = true
        InnerHeightViewContant.constant = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        InitialSetUpLayouts()
    }

}

extension ForgotPasswordVC {
    func InitialSetUpLayouts()  {
        self.btnReset.layer.borderColor = Global.kAppColor.PrimaryBlue.cgColor
        self.btnReset.layer.cornerRadius = 5.0
        self.btnReset.layer.borderWidth = 1
    }
}


extension ForgotPasswordVC {
   
}


extension ForgotPasswordVC {
    @IBAction func btnResetAction_Tapped(_ sender: IPAutoScalingButton) {
        InnerForgotView.isHidden = false
        InnerHeightViewContant.constant = Global.singleton.getDeviceSpecificFontSizeHeight(205)
    }
    
    @IBAction func btnBackAction_Tapped(_ sender: IPAutoScalingButton) {
        self.navigationController?.popViewController(animated: true)
    }

   

}
