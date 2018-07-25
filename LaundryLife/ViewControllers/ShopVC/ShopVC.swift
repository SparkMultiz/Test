//
//  ShopVC.swift
//  LaundryLife
//
//  Created by Chirag Patel on 7/24/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//

import UIKit

class ShopVC: UIViewController {

    @IBOutlet weak var btnSlideMenu: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}



extension ShopVC {
    @IBAction func btnSlidMenuClick(_ sender: UIButton) {
        let revealController : SlideMenuController = self.slideMenuController()!
        revealController.addRightGestures()
        revealController.openLeft()
    }
}
