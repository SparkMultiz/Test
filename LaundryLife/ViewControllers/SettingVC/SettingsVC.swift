//
//  SettingsVC.swift
//  LaundryLife
//
//  Created by Chirag Patel on 7/23/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var btnSlideMenu: UIButton!
    @IBOutlet weak var tblSettings: UITableView!
    
    var arrItemName = [String]()
    var arrItemDetailName = [String]()
    var arrItemImage = [UIImage]()
    var arrItemRigtImage = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        tblSettings.register(UINib(nibName: "SettingCustomCell", bundle: nil), forCellReuseIdentifier: "SettingCustomCell")
        tblSettings.reloadData()
        arrItemImage = [#imageLiteral(resourceName: "Account"),#imageLiteral(resourceName: "Fingerprint"),#imageLiteral(resourceName: "Contacts"),#imageLiteral(resourceName: "Launcher")]
        arrItemRigtImage = [#imageLiteral(resourceName: "Cloud"),#imageLiteral(resourceName: "Iphone"),#imageLiteral(resourceName: "Cloud"),#imageLiteral(resourceName: "Cloud")]

        arrItemName = ["Login Credential","Login Preferences","Contact details","Appliance information"]
        arrItemDetailName = ["Office,...","Login automatically, Home","Office,01274818629","Electrolux, WPHOME17L,7C7A5.."]
        self.tblSettings.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


extension SettingsVC {
    @IBAction func btnSlidMenuClick(_ sender: UIButton) {
        let revealController : SlideMenuController = self.slideMenuController()!
        revealController.addRightGestures()
        revealController.openLeft()
    }
}

extension SettingsVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = 
            tableView.dequeueReusableCell(withIdentifier: "SettingCustomCell") as! SettingCustomCell
        cell.selectionStyle = .none
        cell.lblSettingsName.text = arrItemName[indexPath.row]
        cell.lblSettingsDiscription.text = arrItemDetailName[indexPath.row]
        cell.ImgSettings.image = arrItemImage[indexPath.row]
        cell.imgRightBarSettings.image = arrItemRigtImage[indexPath.row]
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrItemName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

