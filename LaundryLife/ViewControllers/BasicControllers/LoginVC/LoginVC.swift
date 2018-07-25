//
//  Created by Chirag Patel on 7/21/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var txtPassword: IPAutoScalingTextField!
    @IBOutlet weak var txtEmail: IPAutoScalingTextField!
    
    @IBOutlet weak var btmLogin: IPAutoScalingButton!
    @IBOutlet weak var btnRememeberMe: UIButton!
    @IBOutlet weak var btnNewAccount: IPAutoScalingButton!
    @IBOutlet weak var btnForgotPassword: IPAutoScalingButton!

   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkGDPRPermissionFromUser()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        self.InitialSetUpLayouts()
    }
}

// MARK: - View LayoutSetup Methods
extension LoginVC {
    func InitialSetUpLayouts()  {        
        self.btnNewAccount.layer.borderColor = Global.kAppColor.PrimaryBlue.cgColor
        self.btmLogin.layer.borderColor = Global.kAppColor.PrimaryBlue.cgColor
        self.btmLogin.layer.cornerRadius = 5.0
        self.btnNewAccount.layer.cornerRadius = 5.0
        self.btnNewAccount.layer.borderWidth = 1
    }
}

// MARK: - API Call Methods
extension LoginVC {
    func checkValidationFunction() {
        /*let strEmail = txtEmail.text!.trimmingCharacters(in: .whitespaces)
        guard strEmail.count > 0 else {
            Singleton.sharedSingleton.showSuccessAlert(withMsg: "Please enter Email Id")
            return
        }
        guard strEmail.isEmail else {
            Singleton.sharedSingleton.showSuccessAlert(withMsg: "Please enter valid Email Id")
            return
        }
        guard txtPassword.text!.count > 0 else {
            Singleton.sharedSingleton.showSuccessAlert(withMsg: "Please enter password")
            return
        }
        let strPass = txtPassword.text!.trimmingCharacters(in: .whitespaces)

        guard strPass.isValidateSocialPassword else {
            Singleton.sharedSingleton.showSuccessAlert(withMsg: "Password should be 6 or 8 characters with contain at least 1 upper case, 1 lower case, 1 special charcter and 1 numeric.")
            return
        }*/
        callLoginApiFunction()
    }
    

    func callLoginApiFunction()  {
        LoginManager().callLoginAPIService(strEmail: txtEmail.text!, strPassword: txtPassword.text!)
    }
    
}

// MARK: - All Button Click Method
extension LoginVC {
    @IBAction func btnLoginAction_Tapped(_ sender: IPAutoScalingButton) {
        checkValidationFunction()
    }
    
    @IBAction func btnNewAccountAction_Tapped(_ sender: IPAutoScalingButton) {
        self.view.endEditing(true)
        let SignUpVCOBJ = SignUpVC(nibName: "SignUpVC", bundle: nil)
        self.navigationController?.pushViewController(SignUpVCOBJ, animated: true)
    }
    
    @IBAction func btnRememeberMeAction_Tapped(_ sender: UIButton) {
    }
    
    @IBAction func btnForgotPasswordAction_Tapped(_ sender: IPAutoScalingButton) {
        self.view.endEditing(true)
        let ForgotPasswordVCOBJ = ForgotPasswordVC(nibName: "ForgotPasswordVC", bundle: nil)
        self.navigationController?.pushViewController(ForgotPasswordVCOBJ, animated: true)
    }
}

extension LoginVC {
    // MARK: - CHeck GDPRPermission Method
    func checkGDPRPermissionFromUser() {
        let isGrantedGDPRPermissionByUser = UserDefaults.standard.checkGDPRAccessStatus()
        if isGrantedGDPRPermissionByUser == false {
            let appdel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            appdel.showGDPRPermissionView()
        } else {
            
        }
    }
}

// MARK: - UserDefault Extention
extension UserDefaults {
    func setDataInGDPRAccess(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isGDPRPermissionAccess.rawValue)
        //synchronize()
    }
    func checkGDPRAccessStatus()-> Bool {
        return bool(forKey: UserDefaultsKeys.isGDPRPermissionAccess.rawValue)
    }
}


enum UserDefaultsKeys : String {
    case isGDPRPermissionAccess
}
