//
//  Enums.swift
//  WebserviceExample
//
//  Created by Admin on 16/11/19.
//  Copyright © 2019 Piyush. All rights reserved.
//

import UIKit

/// Enum For Storyboard
enum Storyboard: String {
    ///
    case login = "Main"
    ///
    var filename: String {
        return rawValue
    }
}

/// Enum For DevelopmentEnvironment
enum DevelopmentEnvironment: String {
    ///
    case development = "Development"
    ///
    case production = "Production"
    ///
    case local = "Local"
    ///
    case staging = "Staging"
}

enum CellIdentifier: String {
    case cell = "cell"
}

enum MimeType: String {
    case png = "image/png"
    case jpg = "image/jpg"
    case m4a = "audio/m4a"
}

/// Enum For cornerRadius
enum CornerRadius: CGFloat {
    ///
    case small = 3.0
    ///
    case medium = 5.0
    ///
    case regular = 8.0
    ///
    case big = 12.0
    ///
    var filename: CGFloat {
        return rawValue
    }
}
