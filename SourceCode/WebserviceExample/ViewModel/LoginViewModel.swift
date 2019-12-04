//
//  LoginViewModel.swift
//  WebserviceExample
//
//  Created by Admin on 17/11/19.
//  Copyright © 2019 Piyush. All rights reserved.
//

import UIKit

import SwiftyJSON

class LoginViewModel: NSObject {

    func callGETAPI() {
        // get api sample
        ApiManager.sharedInstance.requestFor(urlPath: "https://www.restcountries.eu/rest/v2/all", param: nil, httpMethod: .get, includeHeader: false, success: { (response) in
            print(response)
            
            let json = JSON(response).arrayValue
            
            print(json)
            
        }, failure: { [weak self] (response, error) in
            print(response, error)
        })
    }
    
//    // MARK: - Validation Login
//
//    ///
//    /// Validation for login
//    ///
//    /// - Parameter completion: completion return with bool and message string
//    func validation(completion: @escaping (Bool, String) -> Void) {
//        let emailValue = email.value ?? ""
//        let passwordValue = password.value ?? ""
//        if emailValue.isEmpty && passwordValue.removeWhiteSpace().isEmpty {
//            completion(false, Messages.LoginScreen.strEmailAndPassValidMsg)
//        } else if emailValue.removeWhiteSpace().isEmpty {
//            completion (false, Messages.LoginScreen.strEmailIdMsg)
//        } else if emailValue.isValidEmail() == false {
//            completion (false, Messages.LoginScreen.strValidEmailIdMsg)
//        } else if passwordValue.removeWhiteSpace().isEmpty {
//            completion (false, Messages.LoginScreen.strpasswordMsg)
//        } else {
//            completion (true, "")
//        }
//    }
}
