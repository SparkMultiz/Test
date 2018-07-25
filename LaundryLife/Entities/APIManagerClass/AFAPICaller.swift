//
//  ViewController.swift
//  DemoApp
//
//  Created by Chirag Patel on 6/19/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//


import UIKit
import SpinKit
import Alamofire

class AFAPICaller: NSObject {
    
    typealias AFAPICallerSuccess = (_ responseData: Any, _ success: Bool) -> Void
    typealias AFAPIGoogleSuccess = (_ success: Bool) -> Void
    
    typealias AFAPICallerFailure = () -> Void
    typealias AFAPICallerFailedCall = (_ Error:String, _ Flag:Bool) -> Void
    static let shared = AFAPICaller()
    
    var staticAPISecrateKey = "10170c4901ae0613d6b7d179c43cc45f"
    var staticAPIKey = "06164993fd655540566ab9beb411d819"
    
    
    // MARK: -  Add loader in view
    func addShowLoaderInView(viewObj: UIView, boolShow: Bool, enableInteraction: Bool) -> UIView? {
        let width : CGFloat = (54 * Global.screenWidth)/320
        let viewSpinnerBg = UIView(frame: CGRect(x: (Global.screenWidth - width) / 2.0, y: (Global.screenHeight - width) / 2.0, width: width, height: width))
        viewSpinnerBg.backgroundColor = #colorLiteral(red: 1, green: 0.7764705882, blue: 0.03921568627, alpha: 1).withAlphaComponent(0.9)  //Global().RGB(r: 240, g: 240, b: 240, a: 0.4)
        viewSpinnerBg.layer.masksToBounds = true
        viewSpinnerBg.layer.cornerRadius = 5.0
        viewObj.addSubview(viewSpinnerBg)
        
        if boolShow {
            viewSpinnerBg.isHidden = false
        }
        else {
            viewSpinnerBg.isHidden = true
        }
        
        if !enableInteraction {
            viewObj.isUserInteractionEnabled = false
        }
        //add spinner in view
        let rtSpinKitspinner: RTSpinKitView = RTSpinKitView(style: RTSpinKitViewStyle.styleArcAlt , color: UIColor.clear)
        rtSpinKitspinner.center = CGPoint(x: (width) / 2.0, y: (width ) / 2.0)
        rtSpinKitspinner.color = #colorLiteral(red: 0.1254901961, green: 0.2431372549, blue: 0.4862745098, alpha: 1)
        rtSpinKitspinner.startAnimating()
        viewSpinnerBg.addSubview(rtSpinKitspinner)
        return viewSpinnerBg
    }
    
    func addShowLoaderInViewSmallLoader(viewObj: UIView, boolShow: Bool, enableInteraction: Bool) -> UIView? {
        let viewSpinnerBg = UIView(frame: CGRect(x: (Global.screenWidth - 54.0) / 2.0, y: (Global.screenHeight - 54.0) / 2.0, width: 20.0, height: 20.0))
        viewSpinnerBg.backgroundColor = Global().RGB(r: 240, g: 240, b: 240, a: 4.0)
        viewSpinnerBg.layer.masksToBounds = true
        viewSpinnerBg.layer.cornerRadius = 5.0
        viewObj.addSubview(viewSpinnerBg)
        
        if boolShow {
            viewSpinnerBg.isHidden = false
        }
        else {
            viewSpinnerBg.isHidden = true
        }
        
        if !enableInteraction {
            viewObj.isUserInteractionEnabled = false
        }
        //add spinner in view
        let rtSpinKitspinner: RTSpinKitView = RTSpinKitView(style: RTSpinKitViewStyle.styleArcAlt , color: UIColor.white)
        rtSpinKitspinner.center = CGPoint(x: (viewSpinnerBg.frame.size.width) / 2.0, y: (viewSpinnerBg.frame.size.height ) / 2.0)
        rtSpinKitspinner.color = #colorLiteral(red: 0.2179464698, green: 0.5849778652, blue: 0.8532606959, alpha: 1)
        rtSpinKitspinner.startAnimating()
        viewSpinnerBg.addSubview(rtSpinKitspinner)
        return viewSpinnerBg
    }
    
    
    // MARK: -  Hide and remove loader from view
    func hideRemoveLoaderFromView(removableView: UIView, mainView: UIView) {
        removableView.isHidden = true
        removableView.removeFromSuperview()
        mainView.isUserInteractionEnabled = true
    }
    
    
    // MARK: -  Generic POST API call Method
    func callAPI_POST(filePath: String,  params: [String: Any]?, enableInteraction: Bool, showLoader: Bool, viewObj: UIView?, onSuccess: @escaping (AFAPICallerSuccess), onFailure: @escaping (AFAPICallerFailure)) {
        
        guard Global.is_Reachablity().isNetwork else {
            Singleton.sharedSingleton.showWarningAlert(withMsg:"No Internet connection. Make sure that the Wifi or Mobile data is turned on, then try again.")
            return
        }
        
        let strPath = Global.baseURLPath + filePath;
        print("URL:- \(strPath) \nPARAM:- \(String(describing: params))")
        
        var viewSpinner: UIView?
        if (showLoader) {
            viewSpinner = self.addShowLoaderInView(viewObj: viewObj!, boolShow: showLoader, enableInteraction: enableInteraction)!
        }

        var headers : [String:String] = [:]
        headers = [
            "X-Api-Key" : "\(staticAPIKey)",
            "X-Api-Secret" : "\(staticAPISecrateKey)"
        ]

        
    
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 100
        manager.request(strPath, method: .post, parameters: params, encoding: URLEncoding() as ParameterEncoding, headers: headers).responseJSON { (response:DataResponse<Any>) in
            print(response)
            if (showLoader) {
                self.hideRemoveLoaderFromView(removableView: viewSpinner!, mainView: viewObj!)
            }
            if response.result.isSuccess {
                if let dictResponse = response.result.value  as? [AnyObject] {
                    onSuccess(dictResponse, true)
                }else if let dictResponse = response.result.value  as? [String:AnyObject] {
                    
                    if let str = dictResponse["status"] as? String , str.toBool() {
                        onSuccess(dictResponse, true)
                    } else {
                        if let errorDic = dictResponse["errors"] as? NSDictionary {
                            if let arrMsg = errorDic.allValues as? [String] {
                                let strMsg = arrMsg.joined(separator: ",")
                                Singleton.sharedSingleton.showWarningAlert(withMsg: strMsg )
                            }
                            onFailure()
                        }else{
                            Singleton.sharedSingleton.showWarningAlert(withMsg:  dictResponse["msg"] as? String ?? "")
                            onFailure()
                        }
                    }
                }
            } else {
                print("Error:- \(String(describing: response.result.error?.localizedDescription))")
                if (showLoader) {
                    self.hideRemoveLoaderFromView(removableView: viewSpinner!, mainView: viewObj!)
                }
                onFailure()
            }
        }
    }
}
