//
//  EnergyVC.swift
//  LaundryLife
//
//  Created by Chirag Patel on 7/24/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//

import UIKit

class EnergyVC: UIViewController {

    @IBOutlet weak var btnSlideMenu: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}



extension EnergyVC {
    @IBAction func btnSlideMenuClick(_ sender: UIButton) {
        let revealController : SlideMenuController = self.slideMenuController()!
        revealController.addRightGestures()
        revealController.openLeft()
    }
}
