//
//  LeftMenuBarVC.swift
//  KoloniKube_Swift
//
//  Created by Tops on 5/1/18.
//  Copyright © 2018 Self. All rights reserved.
//

import UIKit



enum LeftMenu: Int {
    
    case BuyMemberShip = 0
    case MyMembership
    case MyBooking
    case Report
    case Help
    case RateUS
    case Settings
    case Logout
    
}

class LeftMenuBarVC: UIViewController {
    
    @IBOutlet weak var tblSlideMenu: UITableView!
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var btnProfileClick: UIButton!
    @IBOutlet weak var lblCalories: IPAutoScalingLabel!
    @IBOutlet weak var lblRideRate: IPAutoScalingLabel!
    @IBOutlet weak var lblMiles: IPAutoScalingLabel!
    @IBOutlet weak var lblEditProfileIcon: UILabel!
    
    var menusList = ["Buy Membership","My Memberships","My Bookings","Report", "Help","Rate us","Settings","Logout"]
    
    var menuImage = ["","","", "","","","",""]
    
    var MyProfileVController: UIViewController!
    var BuyMembershipVController: UIViewController!
    var MyMemberShipVController: UIViewController!
    var MyBookingVController: UIViewController!
    
    var ReportVController: UIViewController!
    var helpVController: UIViewController!
    var RatingVController: UIViewController!
    var SettingVController: UIViewController!
    var profileDetail = NSMutableDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblSlideMenu.register(UINib(nibName: "tableCustomCell", bundle: nil), forCellReuseIdentifier: "tableCustomCell")
        tblSlideMenu.estimatedRowHeight = 40
        tblSlideMenu.rowHeight = UITableViewAutomaticDimension
        setControllerMethod()
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: Global.notification.Push_ProfileDataCall), object: nil);
        
        NotificationCenter.default.addObserver(self, selector: #selector(userProfileCustomDataInSlideBar(notification:)), name: NSNotification.Name(rawValue: Global.notification.Push_ProfileDataCall), object: nil)
        
    }
    
    
    
    
    func userProfileCustomDataInSlideBar(notification:Notification) -> Void {
        let dictInfoUser = Global.appdel.dictUserInfo
        if (dictInfoUser["FLAG"] as! Bool) {
            let strCalories = "\(dictInfoUser["CALORIES"] as? Int ?? 0)"
            let strRides = "\(dictInfoUser["RIDES"] as? Int ?? 0)"
            let dubleMileValue = Double(dictInfoUser["MILES"] as? String ?? "0.00")
            let strMile  = String(format:"%.2f",dubleMileValue!)
            
            self.profileDetail.setValue(strCalories , forKey: "Calories")
            self.profileDetail.setValue(strRides , forKey: "Rides")
            self.profileDetail.setValue(strMile , forKey: "Mile")
            
            if let arrResult = dictInfoUser["USER_DETAILS"] as? NSArray{
                if let dicResult = arrResult[0] as? NSDictionary {
                    
                    
                    let strFirstName = dicResult["first_name"] as? String ?? ""
                    let strLastName = dicResult["last_name"] as? String ?? ""
                    
                    self.profileDetail.setValue("\(strFirstName) \(strLastName)"
                        , forKey: "username")
                    self.profileDetail.setValue(dicResult["profile_image"] as? String ?? ""
                        , forKey: "profile_image")
                }
            }
        }
        setUpHeaderData()
        self.tblSlideMenu.reloadData()
    }
    
    
    func setUpHeaderData() {
        
        let strProfileImgUrl = profileDetail.object(forKey: "profile_image") as? String ?? ""
        imgProfile.sd_setImage(with: URL(string: strProfileImgUrl), placeholderImage: UIImage(named: "NoProfileImage"))
        lblUserName.text = profileDetail.object(forKey: "username") as? String ?? ""
        
        lblMiles.text = profileDetail.object(forKey: "Mile") as? String ?? ""
        lblCalories.text = profileDetail.object(forKey: "Calories") as? String ?? ""
        lblRideRate.text = profileDetail.object(forKey: "Rides") as? String ?? ""
        btnProfileClick.addTarget(self, action: #selector(btnProfileClick(sender:)), for: .touchUpInside)
    }
    
    func setControllerMethod() {
        
        let MyProfileController = MyProfileVC(nibName: "MyProfileVC", bundle: nil)
        self.MyProfileVController = UINavigationController(rootViewController: MyProfileController)
        
        let BuyMembershipController = BuyMembershipVC(nibName: "BuyMembershipVC", bundle: nil)
        self.BuyMembershipVController = UINavigationController(rootViewController: BuyMembershipController)
        
        let MyMembershipController = MyMemberShipVC(nibName: "MyMemberShipVC", bundle: nil)
        self.MyMemberShipVController = UINavigationController(rootViewController: MyMembershipController)
        
        let MyBookingVController = MyRentalVC(nibName: "MyRentalVC", bundle: nil)
        self.MyBookingVController = UINavigationController(rootViewController: MyBookingVController)
        
        
        let ReportController = ReportVC(nibName: "ReportVC", bundle: nil)
        self.ReportVController = UINavigationController(rootViewController: ReportController)
        
        let helpController = helpVC(nibName: "helpVC", bundle: nil)
        self.helpVController = UINavigationController(rootViewController: helpController)
        
        
        let SettingController = SettingVC(nibName: "SettingVC", bundle: nil)
        self.SettingVController = UINavigationController(rootViewController: SettingController)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.layoutIfNeeded()
        imgProfile.layer.cornerRadius = imgProfile.frame.height / 2
        lblEditProfileIcon.layer.cornerRadius = lblEditProfileIcon.frame.height / 2
        lblEditProfileIcon.clipsToBounds = true
        imgProfile.clipsToBounds = true
    }
    
    func changeViewController(_ menuController: LeftMenu) {
        
        switch menuController {
        case .BuyMemberShip:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Global.notification.is_PushNotification_BuyMembership), object: nil)
            self.slideMenuController()?.changeMainViewController(self.BuyMembershipVController, close: true)
        case .MyMembership:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Global.notification.is_PushNotification_MyMembershiop), object: nil)

            self.slideMenuController()?.changeMainViewController(self.MyMemberShipVController, close: true)
            
        case .MyBooking:
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Global.notification.is_PushNotification_Booking), object: nil)
            self.slideMenuController()?.changeMainViewController(self.MyBookingVController, close: true)
        case .Report:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Global.notification.is_PushNotification_Report), object: nil)

            self.slideMenuController()?.changeMainViewController(self.ReportVController, close: true)
        case .Help:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Global.notification.is_PushNotification_Help), object: nil)

            self.slideMenuController()?.changeMainViewController(self.helpVController, close: true)
        case .RateUS:
            self.slideMenuController()?.changeMainViewController(self.RatingVController, close: true)
        case .Settings:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Global.notification.is_PushNotification_Settings), object: nil)

            self.slideMenuController()?.changeMainViewController(self.SettingVController, close: true)
        case .Logout:
            self.logoutMethodCall()
        }
        
    }
    func logoutMethodCall() {
        Global().delay(delay: 0.5) {
            Global.appdel.LogoutUser()
        }
    }
    
    
}

extension LeftMenuBarVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menusList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell:tableCustomCell = tableView.dequeueReusableCell(withIdentifier: "tableCustomCell") as! tableCustomCell
        Cell.lblControllerName.text = menusList[indexPath.row]
        Cell.lblMenuName.text = menuImage[indexPath.row]
        if Global.appdel.sideMenuSelection == indexPath.row {
            Cell.lblControllerName.textColor = UIColor.red
            Cell.lblMenuName.textColor = UIColor.red
        } else  {
            Cell.lblControllerName.textColor = UIColor.black
            Cell.lblMenuName.textColor = UIColor.black
        }
        Cell.selectionStyle = .none
        return Cell
    }
    
    func btnProfileClick(sender:UIButton)  {
        self.slideMenuController()?.changeMainViewController(self.MyProfileVController, close: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tblSlideMenu.frame.height / 8
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Global.appdel.sideMenuSelection = indexPath.row
        tblSlideMenu.reloadData()
        if indexPath.row == 8 {
            self.logoutMethodCall()
        } else if indexPath.row == 5 {
            UIApplication.shared.openURL(URL(string: "https://itunes.apple.com/us/app/kolonishare/id1265110043?mt=8")!)
        } else if indexPath.row ==  4 || indexPath.row == 5 {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Global.notification.is_KeyboardNumbericOpen), object: nil)
            if let menuController = LeftMenu(rawValue: indexPath.row) {
                self.changeViewController(menuController)
            }
        } else  {
            if let menuController = LeftMenu(rawValue: indexPath.row) {
                self.changeViewController(menuController)
            }
        }
        
    }
}
