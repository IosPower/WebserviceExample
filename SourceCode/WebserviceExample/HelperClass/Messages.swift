//
//  Messages.swift
//  WebserviceExample
//
//  Created by Admin on 16/11/19.
//  Copyright © 2019 Piyush. All rights reserved.
//

import Foundation

/// All the messages to be displayed in the app.
class Messages: NSObject {
    
    ///
    static let strReqTimeOut = "The request timed out, Please try again."
    ///
    static let internetAlertMsg = "Please check your internet connection."
    ///
    static let mailSent = "Mail has been sent successfully."
    ///
    static let mailNotSent = "Mail has not been sent."
    ///
    static let appTitle = "Enhance Quote Tool"
    ///
    static let mailSave = "Draft saved successfully."
    ///
    static let noRecord = "No record found."
    ///
    static let documentNotFound = "Document not found."
    ///
    static let userNorFound = "User not found."
    ///
    static let comingSoon = "Coming Soon."
    ///
    static let somethingWrong = "Something went wrong."
    ///
    static let chooseGallary = "Choose from Photo gallery."
    ///
    static let captureImage = "Capture Image."
    ///
    static let notGettingPdfImages = "Not getting images from pdf."
    ///
    static let selectStartDate = "Please Select Start Date."
    ///
    static let statusUpdated = "Status updated successfully."
    ///
    static let deleteTitle: String = "Are you sure you want to delete?"
    ///
    static let tryAgain: String = "Please try again."
    
    // MARK: - Button title strings
    ///
    struct Button {
        ///
        static let okButton = "OK"
        ///
        static let cancelButton = "Cancel"
        ///
        static let yesButton = "Yes"
        ///
        static let noButton = "No"
    }
    
    // MARK: - Login Screen Messages
    ///
    struct LoginScreen {
        ///
        static let strEmailAndPassValidMsg = "You must enter a valid email address and password."
        ///
        static let strEmailIdMsg = "Please enter an email address."
        ///
        static let strValidEmailIdMsg = "Please enter a valid email address."
        ///
        static let strpasswordMsg = "Please enter password."
        ///
        static let strValidpasswordMsg = "password must be at least 8 characters long."
    }
    
    // MARK: - Reset Password Screen Messages
    ///
    struct ResetPassword {
        ///
        static let strOldPasswordMsg = "Please enter old password."
        ///
        static let strNewPasswordMsg = "Please enter new password."
        ///
        static let strConfirmPasswordMsg = "Please enter confirm new password."
        ///
        static let strPasswordSameMsg = "New password and confirm new password should be same."
        ///
        static let strValidPasswordMsg = "Password should be a minimum of 8 characters including 1 uppercase letter, 1 special character, and alphanumeric characters."
    }
    // MARK: - Email Verified
    ///
    struct EmailVerify {
        ///
        static let description = "Mail has been sent successfully to your registered email address."
    }
    
    // MARK: - Change password
    ///
    struct ChangePassword {
        ///
        static let strOldpasswordMsg = "Please enter old password."
        ///
        static let strNewpasswordMsg = "Please enter new password."
        ///
        static let strConfirmpasswordMsg = "Please enter confirm new password."
        ///
        static let strpasswordSameMsg = "New password and confirm new password should be same."
    }

    // MARK: - Signup Screen
    ///
    struct SignUpScreen {
        ///
        static let firstNameEmpty = "Please enter first name."
        ///
        static let lastNameEmpty = "Please enter last name."
        ///
        static let emailEmpty = "Please enter an email address."
        ///
        static let cellPhoneEmpty = "Please enter cell phone."
        ///
        static let companyNameEmpty = "Please enter company name."
        ///
        static let websiteEmpty = "Please enter website."
        ///
        static let address1Empty = "Please enter address1."
        ///
        static let address2Empty = "Please enter address2."
        ///
        static let countryEmpty = "Please select country."
        ///
        static let stateEmpty = "Please select state."
        ///
        static let cityEmpty = "Please select city."
        ///
        static let zipEmpty = "Please enter zip."
        ///
        static let officePhEmpty = "Please enter office phone."
        ///
        static let phoneNumberValid = "Please enter a valid cell phone."
        ///
        static let officePhoneValid = "Please enter a valid office phone."
        ///
        static let profileImageValid = "Please upload company logo"
        ///
        static let websiteValid = "Please enter a valid website"
    }
}
