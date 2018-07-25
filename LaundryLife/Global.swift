//
//  Global.swift
//  DemoApp
//
//  Created by Chirag Patel on 6/19/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//

import UIKit

class Global {

    static let DeviceUUID = UIDevice.current.identifierForVendor!.uuidString
    static let PhoneDigitLimit = 11
    static let NameDigitLimit = 25
    static let UserNameDigitLimit = 50
    static let StreetNODigitLimit = 20
    static let StreetNameDigitLimit = 60
    
    static var IsOffline:Bool = false
    
    //MARK: - API BASE URL
    static let baseURLPath = "http://ec2-54-76-167-153.eu-west-1.compute.amazonaws.com:8080/"
    
    
  
    struct Platform {
        static let isSimulator: Bool = {
            #if arch(i386) || arch(x86_64)
                return true
            #endif
            return false
        }()
    }
    
    //Device Compatibility
    struct is_Device {
        static let _iPhone = (UIDevice.current.model as String).isEqual("iPhone") ? true : false
        static let _iPad = (UIDevice.current.model as String).isEqual("iPad") ? true : false
        static let _iPod = (UIDevice.current.model as String).isEqual("iPod touch") ? true : false
    }
    
    //Display Size Compatibility
    struct is_iPhone {
        static let _X = (UIScreen.main.bounds.size.height == 2436 ) ? true : false
        static let _6p = (UIScreen.main.bounds.size.height >= 736.0 ) ? true : false
        static let _6 = (UIScreen.main.bounds.size.height <= 667.0 && UIScreen.main.bounds.size.height > 568.0) ? true : false
        static let _5 = (UIScreen.main.bounds.size.height <= 568.0 && UIScreen.main.bounds.size.height > 480.0) ? true : false
        static let _4 = (UIScreen.main.bounds.size.height <= 480.0) ? true : false
    }
    
    //IOS Version Compatibility
    struct is_iOS {
        static let _11 = ((Float(UIDevice.current.systemVersion as String))! >= Float(11.0)) ? true : false
        static let _10 = ((Float(UIDevice.current.systemVersion as String))! >= Float(10.0)) ? true : false
        static let _9 = ((Float(UIDevice.current.systemVersion as String))! >= Float(9.0) && (Float(UIDevice.current.systemVersion as String))! < Float(10.0)) ? true : false
        static let _8 = ((Float(UIDevice.current.systemVersion as String))! >= Float(8.0) && (Float(UIDevice.current.systemVersion as String))! < Float(9.0)) ? true : false
    }
    
    // MARK: -  Shared classes
    static let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    static let singleton = Singleton.sharedSingleton
    
    
    // MARK: -  Screen size
    static let screenWidth : CGFloat = (Global.appDelegate.window!.bounds.size.width)
    static let screenHeight : CGFloat = (Global.appDelegate.window!.bounds.size.height)
    
    // MARK: -  Get UIColor from RGB
    public func RGB(r: Float, g: Float, b: Float, a: Float) -> UIColor {
        return UIColor(red: CGFloat(r / 255.0), green: CGFloat(g / 255.0), blue: CGFloat(b / 255.0), alpha: CGFloat(a))
    }
    
    // MARK: -  Dispatch Delay
    func delay(delay: Double, closure: @escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
    // MARK: -  Application Colors
    struct kAppColor {
        static let PrimaryBlue =  #colorLiteral(red: 0.1254901961, green: 0.2431372549, blue: 0.4862745098, alpha: 1)   //Global().RGB(r: 47.0, g: 128.0, b: 209.0, a: 1.0)
        static let PrimaryYellow =  #colorLiteral(red: 1, green: 0.7764705882, blue: 0.03921568627, alpha: 1)
        static let SecondaryGrey =  #colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1)
        static let SecondaryBlue365188 =  #colorLiteral(red: 0.2117647059, green: 0.3176470588, blue: 0.5333333333, alpha: 1)
        static let SecondaryBlue4059 =  #colorLiteral(red: 0.2509803922, green: 0.3490196078, blue: 0.5607843137, alpha: 1)
        static let SecondaryWightF7 =  #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        static let SecondaryWightF1E =  #colorLiteral(red: 0.9450980392, green: 0.937254902, blue: 0.9411764706, alpha: 0.796403104) // for place holder
        static let SecondaryCopyWightF1E =  #colorLiteral(red: 0.9450980392, green: 0.937254902, blue: 0.9411764706, alpha: 1)
        static let SecondaryRed =  #colorLiteral(red: 0.862745098, green: 0.3058823529, blue: 0.2549019608, alpha: 1)
        static let Red =  #colorLiteral(red: 1, green: 0.2479336871, blue: 0.1060191788, alpha: 1)
    }
    
    // MARK: - Application Fonts
    struct kFont {
        static let Proxima_Semibold = "ProximaNova-Semibold"
        static let Proxima_Bold = "ProximaNova-Bold"
        static let Proxima_Regular = "ProximaNova-Regular"
        static let AlcoholFont = "Alcohol_TOPS"
    }
    
    struct kFontSize {
        static let  TextFieldSmallSize_8:CGFloat = 8
        static let  TextFieldSize:CGFloat = 12
        static let  ButtonSize:CGFloat = 15
        static let  LabelSize:CGFloat = 14
    }
    
    struct g_UserDefaultKey {
        static let DeviceToken: String! = "DEVICE_TOKEN"
    }
    
    struct kAddActivity {
        static let  SelectLifeEvents = "Select Life Events"
        
    }
    func getDeviceSpecificFontSize(_ fontsize: CGFloat) -> CGFloat {
        return ((Global.screenWidth) * fontsize) / 320
    }
    
    struct is_Reachablity {
        var isNetwork = Global.singleton.isConnectivityChecked()
    }
}
