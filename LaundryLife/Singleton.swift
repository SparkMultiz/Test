//
//  Singleton.swift
//  DemoApp
//
//  Created by Chirag Patel on 6/19/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//

import UIKit
import ISMessages
import SpinKit
import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}


class Singleton: NSObject {
    static let sharedSingleton = Singleton()
    func isConnectivityChecked()-> Bool {
        if Connectivity.isConnectedToInternet() {
            print("Yes! internet is available.")
            return true
        } else  {
            return false
        }
    }
    func getDeviceSpecificFontSize(_ fontsize: CGFloat) -> CGFloat {
        return ((Global.screenWidth) * fontsize) / 320
    }
    
    func getDeviceSpecificFontSizeHeight(_ fontsize: CGFloat) -> CGFloat {
        return ((Global.screenHeight) * fontsize) / 480
    }
    
    // MARK: -  Show Message on Success and Failure
    func showSuccessAlert(withMsg message: String) {
        ISMessages.showCardAlert(withTitle: "", message: message, duration: 3.0, hideOnSwipe: true, hideOnTap: true, alertType: ISAlertType.success, alertPosition: ISAlertPosition.top, didHide: nil)
    }
    
    func showWarningAlert(withMsg message: String) {
        ISMessages.showCardAlert(withTitle: "", message: message, duration: 5.0, hideOnSwipe: true, hideOnTap: true, alertType: ISAlertType.warning, alertPosition: ISAlertPosition.top, didHide: nil)
    }
    
    func showSuccessAlertInternet(withMsg message: String) {
        ISMessages.showCardAlert(withTitle: "", message: message, duration: 3.0, hideOnSwipe: true, hideOnTap: true, alertType: ISAlertType.success, alertPosition: ISAlertPosition.top, didHide: nil)
    }
    
    func showWarningAlertInternet(withMsg message: String) {
        ISMessages.showCardAlert(withTitle: "", message: message, duration: 3.0, hideOnSwipe: true, hideOnTap: true, alertType: ISAlertType.error, alertPosition: ISAlertPosition.top, didHide: nil)
    }
}
