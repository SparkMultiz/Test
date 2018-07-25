//
//  NotificationVC.swift
//  LaundryLife
//
//  Created by Chirag Patel on 7/24/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//

import UIKit

class NotificationVC: UIViewController {

    @IBOutlet weak var btnSlideMenu: UIButton!
    @IBOutlet weak var tblNotification: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblNotification.register(UINib(nibName: "NotificationCustomCell", bundle: nil), forCellReuseIdentifier: "NotificationCustomCell")
        tblNotification.reloadData()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension NotificationVC {
    @IBAction func btnSlideMenuClick(_ sender: UIButton) {
        let revealController : SlideMenuController = self.slideMenuController()!
        revealController.addRightGestures()
        revealController.openLeft()
    }
}


extension NotificationVC {
   
}


extension NotificationVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCustomCell") as! NotificationCustomCell
        cell.selectionStyle = .none
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
