//
//  LoginManager.swift
//  LaundryLife
//
//  Created by Vaidehi on 25/07/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//

import UIKit
import Alamofire
class LoginManager: NSObject {

    func callLoginAPIService(strEmail:String , strPassword:String) {
   
        let urlString = "https://api.wifiplug.co.uk/v1.0/session/login"
        let json = "{\"username\":\"office\",\"password\":\"hhh\"}"
        
        let url = URL(string: urlString)!
        let jsonData = json.data(using: .utf8, allowLossyConversion: false)!
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
    
        var headers: HTTPHeaders
        if let existingHeaders = request.allHTTPHeaderFields {
            headers = existingHeaders
        } else {
            headers = HTTPHeaders()
        }
        
        headers["X-Api-Key"] = "06164993fd655540566ab9beb411d819"
        headers["X-Api-Secret"] = "10170c4901ae0613d6b7d179c43cc45f"
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        request.httpBody = jsonData
        
        Alamofire.request(request).responseJSON {
            (response) in
            print(response)
        }
    }
    
}
