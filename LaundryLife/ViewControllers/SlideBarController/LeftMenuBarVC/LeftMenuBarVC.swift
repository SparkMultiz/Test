//
//  LeftMenuBarVC.swift
//  KoloniKube_Swift
//
//  Created by Tops on 5/1/18.
//  Copyright © 2018 Self. All rights reserved.
//

import UIKit



enum LeftMenu: Int {
    
    case Home = 0
    case Notification
    case Energy
    case Shope
    case TripTracks
    case Settings
    case Help
}

class LeftMenuBarVC: UIViewController {
    
    @IBOutlet weak var tblSlideMenu: UITableView!
    
    var menusList = ["Home","Notifications","Energy","Shop", "Tips and tricks","Settings","Help"]
    
    var menuImage = [#imageLiteral(resourceName: "home"),#imageLiteral(resourceName: "Notifications"),#imageLiteral(resourceName: "Energy"),#imageLiteral(resourceName: "Shope"),#imageLiteral(resourceName: "TipsAndTricks"),#imageLiteral(resourceName: "Settings"),#imageLiteral(resourceName: "Settings")]
    
    var HomeVController: UIViewController!
    var NotificationsVController: UIViewController!
    var EnergyVController: UIViewController!
    var ShopVController: UIViewController!
    var TripTricksVController: UIViewController!
    var SettingVController: UIViewController!
    var HelpVController: UIViewController!
    var profileDetail = NSMutableDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblSlideMenu.register(UINib(nibName: "tableCustomCell", bundle: nil), forCellReuseIdentifier: "tableCustomCell")
        tblSlideMenu.estimatedRowHeight = 40
        tblSlideMenu.rowHeight = UITableViewAutomaticDimension
        setControllerMethod()
    }
    
    func setControllerMethod() {
        
        let HomeController = HomeVC(nibName: "HomeVC", bundle: nil)
        self.HomeVController = UINavigationController(rootViewController: HomeController)
        
        let NotiController = NotificationVC(nibName: "NotificationVC", bundle: nil)
        self.NotificationsVController = UINavigationController(rootViewController: NotiController)
        
        
        let EnergyController = EnergyVC(nibName: "EnergyVC", bundle: nil)
        self.EnergyVController = UINavigationController(rootViewController: EnergyController)
        
        let ShopController = ShopVC(nibName: "ShopVC", bundle: nil)
        self.ShopVController = UINavigationController(rootViewController: ShopController)
        
        let TripAndTrickController = TripAndTrickVC(nibName: "TripAndTrickVC", bundle: nil)
        self.TripTricksVController = UINavigationController(rootViewController: TripAndTrickController)
        
        
        let SettingController = SettingsVC(nibName: "SettingsVC", bundle: nil)
        self.SettingVController = UINavigationController(rootViewController: SettingController)
        let HelpController = HelpVC(nibName: "HelpVC", bundle: nil)
        self.HelpVController = UINavigationController(rootViewController: HelpController)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.layoutIfNeeded()
    }
    
    func changeViewController(_ menuController: LeftMenu) {
        
        switch menuController {
        case .Home:
            //  NotificationCenter.default.post(name: NSNotification.Name(rawValue: Global.notification.is_PushNotification_BuyMembership), object: nil)
            self.slideMenuController()?.changeMainViewController(self.HomeVController, close: true)
        case .Notification:
            // NotificationCenter.default.post(name: NSNotification.Name(rawValue: Global.notification.is_PushNotification_MyMembershiop), object: nil)
            
            self.slideMenuController()?.changeMainViewController(self.NotificationsVController, close: true)
            
        case .Energy:
            
            // NotificationCenter.default.post(name: NSNotification.Name(rawValue: Global.notification.is_PushNotification_Booking), object: nil)
            self.slideMenuController()?.changeMainViewController(self.EnergyVController, close: true)
        case .Shope:
            //NotificationCenter.default.post(name: NSNotification.Name(rawValue: Global.notification.is_PushNotification_Report), object: nil)
            
            self.slideMenuController()?.changeMainViewController(self.ShopVController, close: true)
        case .TripTracks:
            // NotificationCenter.default.post(name: NSNotification.Name(rawValue: Global.notification.is_PushNotification_Help), object: nil)
            
            self.slideMenuController()?.changeMainViewController(self.TripTricksVController, close: true)
        case .Settings:
            self.slideMenuController()?.changeMainViewController(self.SettingVController, close: true)
        case .Help:
            // NotificationCenter.default.post(name: NSNotification.Name(rawValue: Global.notification.is_PushNotification_Settings), object: nil)
            
            self.slideMenuController()?.changeMainViewController(self.HelpVController, close: true)
            break
            
        }
    }
    func logoutMethodCall() {
        Global().delay(delay: 0.5) {
            // Global.appdel.LogoutUser()
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
        Cell.imgMenu.image = menuImage[indexPath.row]
        Cell.lblControllerName.textColor = Global.kAppColor.PrimaryBlue
        
//        if Global.appdel.sideMenuSelection == indexPath.row {
//            Cell.lblControllerName.textColor = UIColor.red
//            Cell.lblMenuName.textColor = UIColor.red
//        } else  {
//            Cell.lblControllerName.textColor = UIColor.black
//            Cell.lblMenuName.textColor = UIColor.black
//        }
        
        Cell.selectionStyle = .none
        return Cell
    }
    
    
    func getDeviceSpecificFontSizeHeight(_ fontsize: CGFloat) -> CGFloat {
        return ((Global.screenHeight) * fontsize) / 568
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.getDeviceSpecificFontSizeHeight(35)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Global.appdel.sideMenuSelection = indexPath.row
        tblSlideMenu.reloadData()
        if let menuController = LeftMenu(rawValue: indexPath.row) {
            self.changeViewController(menuController)
        }
        
    }
}
