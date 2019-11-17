//
//  LoginModel.swift
//  WebserviceExample
//
//  Created by Admin on 16/11/19.
//  Copyright © 2019 Piyush. All rights reserved.
//

import Foundation
import SwiftyJSON

/// LoginModel contains userDetails Parameters
class LoginModel: Codable {
    // MARK: - Variables
    
    ///
    var userId: Int?
    ///
    var firstName: String = ""
    ///
    var email: String = ""
    ///
    var lastName: String = ""
    ///
    var mobile: String = ""
    ///
    var fullName: String = ""
    ///
    var company: String = ""
    ///
    var website: String = ""
    ///
    var address1: String = ""
    ///
    var address2: String = ""
    ///
    var role: String = ""
    ///
    var zipCode: String = ""
    ///
    var officePhone: String = ""
    ///
    var path: String = ""
    ///
    var companyLogo: String = ""
    ///
    var isProject = false
    ///
    var isPreference = false
   
    
    // MARK: - Initialize
    
    ///
    convenience init(json: JSON?, imagePath: String?) {
        self.init()
        guard let jsonResponse = json else {
            return
        }
        path = imagePath ?? ""
        userId = jsonResponse[ModelKeys.UserKeys.userId].intValue
        firstName = jsonResponse[ModelKeys.UserKeys.firstName].stringValue
        lastName = jsonResponse[ModelKeys.UserKeys.lastName].stringValue
        mobile = jsonResponse[ModelKeys.UserKeys.mobile].stringValue
        email = jsonResponse[ModelKeys.UserKeys.email].stringValue
        company = jsonResponse[ModelKeys.UserKeys.company].stringValue
        website = jsonResponse[ModelKeys.UserKeys.website].stringValue
        address1 = jsonResponse[ModelKeys.UserKeys.address1].stringValue
        address2 = jsonResponse[ModelKeys.UserKeys.address2].stringValue
        zipCode = jsonResponse[ModelKeys.UserKeys.zipCode].stringValue
        officePhone = jsonResponse[ModelKeys.UserKeys.officePhone].stringValue
        companyLogo = jsonResponse[ModelKeys.UserKeys.companyLogo].stringValue
        
        fullName = "\(firstName)" + " " + "\(lastName)"
        
        isPreference = jsonResponse[ModelKeys.UserKeys.isPreference].boolValue
        isProject = jsonResponse[ModelKeys.UserKeys.isProject].boolValue
    }
}
