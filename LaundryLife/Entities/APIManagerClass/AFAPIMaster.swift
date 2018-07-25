//
//  AFAPIMaster.swift
//  chilax74-16
//
//  Created by Tops on 6/15/17.
//  Copyright © 2017 Tops. All rights reserved.
//  Ilesh 

import UIKit

class AFAPIMaster: AFAPICaller {
    static let sharedAPIMaster = AFAPIMaster()
    
    typealias AFAPIMasterSuccess = (_ returnData: Any) -> Void
    typealias AFAPIMasterFailure = () -> Void
    
    // MARK:-  ALL API Call Method
    
    // MARK:-  Login API Call Method
    
    func postLoginCall_Completion(params:[String:Any]?, showLoader: Bool, enableInteraction: Bool, viewObj: UIView ,onSuccess: @escaping (AFAPIMasterSuccess), onFailure: @escaping (AFAPIMasterFailure)) {
        self.callAPI_POST(filePath: "session/login", params: params, enableInteraction: enableInteraction, showLoader: showLoader, viewObj: viewObj, onSuccess: { (responseDict:Any, success:Bool) in
            if (success){
                onSuccess(responseDict)
            }
        }, onFailure:{ () in
            onFailure()
        })
    }
    
    // MARK:-  SignUp API Call Method
    func postSignUpCall_Completion(params:[String:Any]?, showLoader: Bool, enableInteraction: Bool, viewObj: UIView, onSuccess: @escaping (AFAPIMasterSuccess)) {
        self.callAPI_POST(filePath: "session/login", params: params, enableInteraction: enableInteraction, showLoader: showLoader, viewObj: viewObj, onSuccess: { (responseDict:Any, success:Bool) in
            if (success){
                onSuccess(responseDict)
            }
        }, onFailure:{ () in
            
        })
    }
    
    // MARK:-  ForgotPassword API Call Method
    func postForgotPasswordCall_Completion(params:[String:Any]?, showLoader: Bool, enableInteraction: Bool, viewObj: UIView, onSuccess: @escaping (AFAPIMasterSuccess)) {
        self.callAPI_POST(filePath: "session/login", params: params, enableInteraction: enableInteraction, showLoader: showLoader, viewObj: viewObj, onSuccess: { (responseDict:Any, success:Bool) in
            if (success){
                onSuccess(responseDict)
            }
        }, onFailure:{ () in
            
        })
    }
    
    // MARK:-  ChangePassword API Call Method
    func postChangePasswordCall_Completion(params:[String:Any]?, showLoader: Bool, enableInteraction: Bool, viewObj: UIView, onSuccess: @escaping (AFAPIMasterSuccess)) {
        self.callAPI_POST(filePath: "session/login", params: params, enableInteraction: enableInteraction, showLoader: showLoader, viewObj: viewObj, onSuccess: { (responseDict:Any, success:Bool) in
            if (success){
                onSuccess(responseDict)
            }
        }, onFailure:{ () in
            
        })
    }
    
    // MARK:-  UpdateInformation API Call Method
    func postUpdateInformationdCall_Completion(params:[String:Any]?, showLoader: Bool, enableInteraction: Bool, viewObj: UIView, onSuccess: @escaping (AFAPIMasterSuccess)) {
        self.callAPI_POST(filePath: "session/login", params: params, enableInteraction: enableInteraction, showLoader: showLoader, viewObj: viewObj, onSuccess: { (responseDict:Any, success:Bool) in
            if (success){
                onSuccess(responseDict)
            }
        }, onFailure:{ () in
            
        })
    }
    
    
}
