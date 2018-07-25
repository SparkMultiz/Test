//
//  Created by Chirag Patel on 7/21/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var btnNewAccount: IPAutoScalingButton!
    
    @IBOutlet weak var txtPassword: IPAutoScalingTextField!
    @IBOutlet weak var txtEmail: IPAutoScalingTextField!
   
    @IBOutlet weak var btnRememeberMe: UIButton!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var btnForgotPassword: IPAutoScalingButton!
    @IBOutlet weak var btmLogin: IPAutoScalingButton!

   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        self.InitialSetUpLayouts()
    }
}

extension LoginVC {
    func InitialSetUpLayouts()  {        
        self.btnNewAccount.layer.borderColor = Global.kAppColor.PrimaryBlue.cgColor
        self.btmLogin.layer.borderColor = Global.kAppColor.PrimaryBlue.cgColor
        self.btmLogin.layer.cornerRadius = 5.0
        self.btnNewAccount.layer.cornerRadius = 5.0
        self.btnNewAccount.layer.borderWidth = 1
    }
}


extension LoginVC {
    @IBAction func btnLoginAction_Tapped(_ sender: IPAutoScalingButton) {
    }
    @IBAction func btnNewAccountAction_Tapped(_ sender: IPAutoScalingButton) {
    }
    @IBAction func btnRememeberMeAction_Tapped(_ sender: UIButton) {
    }
    @IBAction func btnForgotPasswordAction_Tapped(_ sender: IPAutoScalingButton) {
    }
}
