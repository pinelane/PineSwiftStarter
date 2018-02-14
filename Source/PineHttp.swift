//
//  PineHttp.swift
//  PineSwiftStarter
//
//  Created by Prakash Raman on 14/02/18.
//  Copyright © 2018 Prakash Raman. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

var PINEHTTP_ENDPOINT = ""
var PINEHTTP_HEADER_TOKEN = ""

open class PineHttp {
    let url : String
    let method : HTTPMethod
    let parameters : Parameters
    var headers: HTTPHeaders
    
    public init(url: String, method: HTTPMethod = .get, parameters: Parameters = [:], headers: HTTPHeaders = [:]) {
        self.method = method
        self.parameters = parameters
        self.url = PINEHTTP_ENDPOINT + url
        self.headers = headers
        self.processHeaders()
    }
    
    open func run(success: @escaping (JSON) -> Void, error: @escaping (JSON) -> Void = {_ in}){
        print("Running: \(url) with: \(parameters)")
        Alamofire.request(url, method: self.method, parameters: parameters, encoding: URLEncoding.default, headers: self.headers).responseJSON { (response) in
            //            print("response: \(response)")
            if [500, 404].contains(response.response!.statusCode) {
                print("ERROR AT RESPONSE: \(response)")
                error(JSON(response.result.value))
                return
            }
            success(JSON(response.result.value))
        }
    }
    
    // THIS METHOD SHOULD BE OVERRIDDEN AND
    open func processHeaders(){
        self.headers["token"] = PINEHTTP_HEADER_TOKEN
    }
    
    // THIS METHOD SHOULD BE OVERRIDDEN AND
    open static func setHeaderToken(token : String){
        PINEHTTP_HEADER_TOKEN = token
    }
    
    open static func setEndpoint(endpoint : String) {
        PINEHTTP_ENDPOINT = endpoint
    }
}
