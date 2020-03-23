//
//  RDUalaService.swift
//  Uala
//
//  Created by Ruben on 21/03/2020.
//  Copyright © 2020 Barboza. All rights reserved.
//

import UIKit
import Alamofire

class RBMealsService: NSObject {
    private var alamofireManager: Session
    
    func serviceURL() -> String {
//        let baseURL = MBApplicationConfig.sharedInstance.basePath()
//        let servlet = MBApplicationConfig.sharedInstance.servletPath()
//
//        return "\(baseURL)/\(servlet)"
        return "https://www.themealdb.com/api/json/v1/1/"
    }
    
    override init() {
       
        self.alamofireManager = Session()
    }
    
    func  getRequest(url: String, successful: @escaping (Data)->(), failure: @escaping (String)->()) {
        /*
        self.alamofireManager.request(self.serviceURL() + url,
                                      method: .get,
                                      parameters: nil,
                                      encoding: JSONEncoding.default).validate().responseString { (response) in
                                        switch response.result {
                                        case .success(let value):
                                            let encodedString : Data = (value as NSString).data(using: String.Encoding.utf8.rawValue)!
                                           success(encodedString)
                                            
                                        case .failure(let error):
                                            print("Fail: \(error.localizedDescription)")
                                            failure(error.localizedDescription)
                                        }
        }
        */
        self.alamofireManager.request(self.serviceURL() + url,
                                      method: .get,
                                      parameters: nil,
                                      encoding: JSONEncoding.default).validate().responseString { (response) in
                                        
                                        switch response.result {
                                        case .success(let _):
                                            successful(response.data!)
                                            
                                        case .failure(let error):
                                            print("Fail: \(error.localizedDescription)")
                                            failure(error.localizedDescription)
                                        }
        }
    }
    
    func getMeals(byFilter filter:String, successful: @escaping ([Meal]?)->(), failure: @escaping (String)->()) {
        let params = "search.php?s=\(filter)"
        self.getRequest(url: params, successful: { (data) in
            //
            let response:RBGetMealsResponse = try! JSONDecoder().decode(RBGetMealsResponse.self,from: data)
            successful(response.meals)
        }, failure: failure)
        
    }
    
}
