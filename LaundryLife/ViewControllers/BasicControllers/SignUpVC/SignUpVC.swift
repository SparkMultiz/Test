//
//  SignUpVC.swift
//  LaundryLife
//
//  Created by Chirag Patel on 7/21/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var btnSubmit: IPAutoScalingButton!
    @IBOutlet weak var LoginViewContant: NSLayoutConstraint!
    @IBOutlet weak var HideShowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnSubmit.setTitle("Submit", for: .normal)
        self.LoginViewContant.constant = 0
        self.HideShowView.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidLayoutSubviews() {
        self.InitialSetUpLayouts()
    }

    
}


extension SignUpVC {
    func InitialSetUpLayouts()  {
        self.btnSubmit.layer.cornerRadius = 5.0
        self.btnSubmit.layer.borderWidth = 1
        self.btnSubmit.layer.borderColor = Global.kAppColor.PrimaryBlue.cgColor
    }
}


extension SignUpVC {
   
}


extension SignUpVC {
    @IBAction func btnSubmitClick(_ sender: IPAutoScalingButton) {
        self.btnSubmit.setTitle("Sign up", for: .normal)
        self.HideShowView.isHidden = false
        self.LoginViewContant.constant = Singleton().getDeviceSpecificFontSizeHeight(485)
    }
    
    @IBAction func btnBackAction_Tapped(_ sender: IPAutoScalingButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
