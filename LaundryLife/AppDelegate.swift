//
//  AppDelegate.swift
//  LaundryLife
//
//  Created by Chirag Patel on 7/21/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift
import ISMessages

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController:UINavigationController?
    var GDPRVerification : GDPRVerificationView!
    var ObjSlideMenuController : SlideMenuController!
    var sideMenu : LeftMenuBarVC?

    var isTearmsStatus = Bool()
    var isPrivacyStatus = Bool()
    var tempTearmsStatus = Bool()
    var tempPrivacyStatus = Bool()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.statusBarStyle = .lightContent
        IQKeyboardManager.shared.enable = true
        
        let login = LoginVC(nibName: "LoginVC", bundle: nil)
        navController = UINavigationController(rootViewController: login)
        navController?.isNavigationBarHidden = true
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }

 
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "LaundryLife")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
    func showGDPRPermissionView(){
        if GDPRVerification == nil {
            let arrNib = Bundle.main.loadNibNamed("GDPRVerificationView", owner: self, options: nil)
            GDPRVerification = arrNib![0] as? GDPRVerificationView
            GDPRVerification.frame = CGRect(x: 0, y: 0, width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height) //UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 20))
            GDPRVerification.btnContinue.addTarget(self, action: #selector(btnContinueTapped_Action), for: .touchUpInside)
            GDPRVerification.btnExite.addTarget(self, action: #selector(btnExitTapped_Action), for: .touchUpInside)
            GDPRVerification.btnPrivacy.addTarget(self, action: #selector(btnPrivacyTapped_Action), for: .touchUpInside)
            GDPRVerification.btnTearmsCondition.addTarget(self, action: #selector(btnTearmsConditionTapped_Action), for: .touchUpInside)
            GDPRVerification.btnCheckBoxTearmsCondition.addTarget(self, action: #selector(btnCheckBoxTearmsConditionTapped_Action(sender:)), for: .touchUpInside)
            GDPRVerification.btnCheckBoxPrivacy.addTarget(self, action: #selector(btnCheckBoxPrivacyTapped_Action(sender:)), for: .touchUpInside)
            GDPRVerification.btnCheckBoxTearmsCondition.layer.borderWidth = 0.8
            GDPRVerification.btnCheckBoxPrivacy.layer.borderWidth = 0.8
            GDPRVerification.btnCheckBoxTearmsCondition.layer.borderColor = UIColor.darkText.cgColor
            GDPRVerification.btnCheckBoxPrivacy.layer.borderColor = UIColor.darkText.cgColor
            GDPRVerification.btnCheckBoxTearmsCondition.layer.cornerRadius = 5
            GDPRVerification.btnCheckBoxPrivacy.layer.cornerRadius = 5
            GDPRVerification.btnCheckBoxPrivacy.layer.masksToBounds = true
            GDPRVerification.btnCheckBoxTearmsCondition.layer.masksToBounds = true
            GDPRVerification.btnCheckBoxPrivacy.clipsToBounds = true
            GDPRVerification.btnCheckBoxTearmsCondition.clipsToBounds = true
            
            let window = UIApplication.shared.keyWindow!
            window.addSubview(GDPRVerification)
            
        } else {
            GDPRVerification.isHidden = false
        }
    }
    
    func SetUpSlideMenuMethod() {
        let settingViewController = SettingsVC(nibName: "SettingsVC", bundle: nil)
        self.sideMenu = LeftMenuBarVC(nibName:"LeftMenuBarVC",bundle: nil)
        self.ObjSlideMenuController = SlideMenuController.init(mainViewController: settingViewController, leftMenuViewController: self.sideMenu!)
        Global.appDelegate.navController?.pushViewController(self.ObjSlideMenuController, animated: false)

    }
    
    
    @objc func btnContinueTapped_Action(){
        if self.isTearmsStatus == true && self.isPrivacyStatus == true {
            if GDPRVerification.btnCheckBoxTearmsCondition.isSelected && GDPRVerification.btnCheckBoxPrivacy.isSelected {
                UserDefaults.standard.setDataInGDPRAccess(value: true)
                self.RemoveBookingRunningView()
            }
        } else {
            self.showWarningAlert(withMsg: "Please accept the Terms of Use and Privacy policy")
        }
    }
    
    @objc func btnExitTapped_Action(){
        self.RemoveBookingRunningView()
        exit(0);
    }
    
    @objc func btnPrivacyTapped_Action(){
        let privacyURL = URL(string: "https://wifiplug.co.uk/privacy/")
        UIApplication.shared.open(privacyURL!, options: [ : ]) { (true) in
        }
    }
    
    @objc func btnTearmsConditionTapped_Action(){
        let tearmsURL = URL(string: "https://wifiplug.co.uk/terms/")
        UIApplication.shared.open(tearmsURL!, options: [ : ]) { (true) in
        }
    }
    
    @objc func btnCheckBoxTearmsConditionTapped_Action(sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sender.backgroundColor = UIColor.clear
            self.isTearmsStatus = false
            
        } else {
            sender.isSelected = true
            sender.backgroundColor = UIColor(red: 0/255, green: 150/255, blue: 255/255, alpha: 1.0)
            self.isTearmsStatus = true
        }
    }
    
    @objc func btnCheckBoxPrivacyTapped_Action(sender:UIButton){
        if sender.isSelected {
            sender.isSelected = false
            sender.backgroundColor = UIColor.clear
            self.isPrivacyStatus = false
            
        } else {
            sender.backgroundColor = UIColor(red: 0/255, green: 150/255, blue: 255/255, alpha: 1.0)
            sender.isSelected = true
            self.isPrivacyStatus = true
        }
    }
    
    func RemoveBookingRunningView(){
        //viewRunningBooking.removeFromSuperview()
        if GDPRVerification != nil {
            GDPRVerification.isHidden = true
        }
    }
    
    
    func showWarningAlert(withMsg message: String) {
        ISMessages.showCardAlert(withTitle: "", message: message, duration: 3.0, hideOnSwipe: true, hideOnTap: true, alertType: ISAlertType.warning, alertPosition: ISAlertPosition.top, didHide: nil)
    }

}

