//
//  ModelKeyEnums.swift
//  WebserviceExample
//
//  Created by Admin on 16/11/19.
//  Copyright © 2019 Piyush. All rights reserved.
//
import UIKit

/// useful keys
struct ModelKeys {
    
    ///
    struct ApiHeaderKeys {
        static let contentType = "Content-Type"
        static let applicationOrJson = "application/json"
        static let multipartOrFormData = "multipart/form-data"
        static let token = "x-access-token"
    }
    
    ///
    struct ResetPasswordKeys {
        static let oldPassword = "oldPassword"
        static let newPassword = "newPassword"
        static let confirmPwd = "confirmPwd"
        static let userId = "userId"
    }
    
    /// all user details keys
    struct UserKeys {
        static let userId = "userId"
        static let email = "email"
        static let password = "password"
        
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let mobile = "mobile"
        static let company = "company"
        static let website = "website"
        static let address1 = "address1"
        static let address2 = "address2"
        static let role = "role"
        static let logo = "logo"
        static let countryId = "countryId"
        static let stateId = "stateId"
        static let cityId = "cityId"
        static let zipCode = "zipCode"
        static let officePhone = "officePhone"
        static let companyLogo = "companyLogo"
        static let fullName = "fullName"
        
        static let country = "country"
        static let state = "state"
        
        static let isProject = "isProject"
        static let isPreference = "isPreference"
        static let countryName = "countryName"
        static let stateName = "stateName"
        static let distributors = "distributors"
    }
    
    /// response keys
    struct ResponseKeys {
        static let status = "status"
        static let result = "result"
        static let message = "message"
    }
}
