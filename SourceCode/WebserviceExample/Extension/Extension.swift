//
//  Extension.swift
//  WebserviceExample
//
//  Created by Admin on 16/11/19.
//  Copyright © 2019 Piyush. All rights reserved.
//

import UIKit
import MBProgressHUD

// MARK: - Extension for String Methods
///
extension String {
    /// Trim string from left & right side extra spaces.
    ///
    /// - Returns: final string after removing extra left & right space.
    
    ///
    func removeWhiteSpace() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    // check valid mail
    func isValidEmail() -> Bool {
        if self.isEmpty {
            return false
        }
        let emailRegEx = "[.0-9a-zA-Z_-]+@[0-9a-zA-Z.-]+\\.[a-zA-Z]{2,20}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        if !emailTest.evaluate(with: self) {
            return false
        }
        return true
    }
    
    // check valid Password
    func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$£€§%…^&*\\/()\\[\\]\\-_=+{}|?>.<,:;~`'\"/\\\\]{8,128}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
    
    /// from base64 to string convertion
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    /// string to base64 string
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    /// check string is numeric or not
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
    ///
    func getFilterCharacterSet(strNumorSym: String) -> String {
        let aSet = NSCharacterSet(charactersIn: strNumorSym).inverted
        let compSepByCharInSet = self.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return numberFiltered
    }
    
    ///
    func convertDate(fromInputFormat inputFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", toOutputFormat outputFormat: String = "MM/dd/yyyy") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat//this your string date format
        guard let convertedDate = dateFormatter.date(from: self) else { return nil }
        guard dateFormatter.date(from: self) != nil else { return nil }
        
        dateFormatter.dateFormat =  outputFormat/// "yyyy MMM HH:mm EEEE" this is what you want to convert format
        let timeStamp = dateFormatter.string(from: convertedDate)
        return timeStamp
    }
    
    var currency: String {
        // removing all characters from string before formatting
        let stringWithoutSymbol = self.replacingOccurrences(of: "$", with: "")
        let stringWithoutComma = stringWithoutSymbol.replacingOccurrences(of: ",", with: "")
        
        let styler = NumberFormatter()
        styler.usesGroupingSeparator = true
        styler.maximumFractionDigits = 2
        styler.currencySymbol = ""
        styler.numberStyle = .currency
        styler.locale = Locale.current
        
        if let result = NumberFormatter().number(from: stringWithoutComma), let finalResult = styler.string(from: result) {
            print(finalResult)
            return finalResult
        }
        return self
    }
}
// MARK: - UIButton Extension
extension UIButton {
    /// borderColor
    ///
    /// - Parameter borderColor: CGColor
    func borderColor(_ borderColor: CGColor) {
        layer.borderWidth = 2.0
        layer.borderColor = borderColor
    }
}
// MARK: - UIView Extension
extension UIView {
    /// roundCorners
    ///
    /// - Parameter cornerRadius: radius value
    func roundCorners(cornerRadius: CGFloat = 5.0) {
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
    
    /// This will set corner radius of View
    func round() {
        layer.cornerRadius = frame.size.width/2
        layer.masksToBounds = true
    }
    
    /// borderAndCornerRadius
    ///
    /// - Parameters:
    ///   - cornerRadius: radius value
    ///   - borderWidth: border width value
    ///   - borderColor: border color
    func borderAndCornerRadius(cornerRadius: CGFloat = CornerRadius.medium.rawValue, borderWidth: CGFloat = 1, borderColor: UIColor = UIColor.gray) {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    /// dropShadow
    ///
    /// - Parameter scale: scale in true or false
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 3, height: 2)
        layer.shadowRadius = 10.0
        layer.cornerRadius = 10.0
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func applyGradient(with colours: [UIColor], locations: [NSNumber]? = nil) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func applyGradient(with colours: [UIColor] = [UIColor.gradientLeftSkyColor, UIColor.gradientRightSkyColor]) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.borderColor = UIColor.lightGray.cgColor
        gradient.borderWidth = 1.0
        gradient.cornerRadius = layer.cornerRadius
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    struct AnimationKey {
        static let wiggle = "wiggle"
    }
    
    func startWiggle() {
        let transformAnim  = CAKeyframeAnimation(keyPath: "transform")
        transformAnim.values  = [NSValue(caTransform3D: CATransform3DMakeRotation(0.04, 0.0, 0.0, 1.0)), NSValue(caTransform3D: CATransform3DMakeRotation(-0.04, 0, 0, 1))]
        transformAnim.autoreverses = true
        transformAnim.duration  = 0.105
        transformAnim.repeatCount = Float.infinity
        self.layer.add(transformAnim, forKey: AnimationKey.wiggle)
    }
    
    func stopWiggle() {
        layer.removeAnimation(forKey: AnimationKey.wiggle)
    }
}
// MARK: - NSDictionary Extension
///
extension NSDictionary {
    ///
    func stringFromHttpParameters() -> String {
        var parametersString = ""
        for (key, value) in self {
            if let key = key as? String,
                let value = value as? String {
                parametersString += key + "=" + value + "&"
            }
        }
        let index = parametersString.index(before: parametersString.endIndex)
        // Hemant Change
        parametersString = String(parametersString[..<index])
        return parametersString.replacingOccurrences(of: " ", with: "")
        //.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

// MARK: - UITableViewCell Extension
///
extension UITableViewCell {
    ///
    var selectionColor: UIColor {
        set {
            let view = UIView()
            view.backgroundColor = newValue
            self.selectedBackgroundView = view
        }
        get {
            return self.selectedBackgroundView?.backgroundColor ?? UIColor.white
        }
    }
}

// MARK: - Array Extension
///
extension Array where Iterator.Element == String {
    
    /// sorting string in ascending order
    ///
    /// - Returns: It will return array of sorted string.
    func sortedAscArrayOfString() -> [String] {
        let sortedArray = self.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
        return sortedArray
    }
}

///
extension Int {
    func isZeroValue() -> Bool {
        guard self == 0 else {
            return false
        }
        return true
    }
}
// MARK: UITextField Extension
///
extension UITextField {
    
    /// Place holder color.
    @IBInspectable var placeHolderColorJS: UIColor? {
        get {
            return self.placeHolderColorJS
        }
        set {
            guard let placehldr = self.placeholder else { return }
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? placehldr : "", attributes: [NSAttributedString.Key.foregroundColor: newValue ?? .lightGray])
        }
    }
}


// MARK: Date Extension
///
extension Date {
    
    ///
    func string(withFormat format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
}

// MARK: - Window Extension
extension UIWindow {
    ///
    func showInternetAlert() {
        self.hideHud() 
        let alertController = UIAlertController(title: "No Internet!", message: Messages.internetAlertMsg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { _ in
            print("OK Pressed")
        }
        alertController.addAction(okAction)
        self.makeKeyAndVisible()
        self.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    /// common alert controller
    func showAlert(_ title: String = Messages.appTitle, message: String, buttonTitle: String) {
        DispatchQueue.main.async { [unowned self] in
            let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert )
            alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
            self.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    ///
    func showHud(title: String? = nil) {
        hideHud()
        DispatchQueue.main.async(execute: {
            let hudMbProgress = MBProgressHUD.showAdded(to: self, animated: true)
            hudMbProgress.contentColor = UIColor.white
            if title == nil {
                hudMbProgress.label.text = ""
            } else {
                hudMbProgress.label.text = title ?? ""
            }
            hudMbProgress.bezelView.alpha = 1.0
            hudMbProgress.bezelView.color = UIColor.clear
            hudMbProgress.bezelView.style = .solidColor
            hudMbProgress.backgroundView.color = UIColor.black
            hudMbProgress.backgroundView.alpha = 0.5
            hudMbProgress.backgroundView.style = .solidColor
        })
    }
    ///
    func hideHud() {
        DispatchQueue.main.async(execute: {
            MBProgressHUD.hide(for: self, animated: true)
        })
    }
}

/// Capture screen shot with AlertView
extension UIView {
//    func capture() -> UIImage {
//
//        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, UIScreen.main.scale)
//        if let context = UIGraphicsGetCurrentContext() {
//            self.layer.render(in: context)
//        }
//        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        return image!
//    }
    ///
    func capture() -> UIImage? {
        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

// MARK: - UIDatePicker
extension UIDatePicker {
    ///
    func setDatePickerValidation(currentDate: Date, maximumYear: Int) {
        var calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        guard let timeZone = TimeZone(identifier: "UTC") else { return }
        calendar.timeZone = timeZone
        var components: DateComponents = DateComponents()
        
        components.calendar = calendar
        components.year = 0
        
        guard let cData = calendar.date(byAdding: components, to: currentDate) else { return }
        let minDate: Date = cData
        
        components.year = maximumYear
        
        guard let cDate1 = calendar.date(byAdding: components, to: currentDate) else { return }
        let maxDate: Date = cDate1
        
        self.minimumDate = minDate
        self.maximumDate = maxDate
    }
}

extension Sequence where Element: Equatable {
    var uniqueElements: [Element] {
        return self.reduce(into: []) { uniqueElements, element in
            if !uniqueElements.contains(element) {
                uniqueElements.append(element)
            }
        }
    }
    func maxWidth(minWidth: CGFloat) -> CGFloat {
        var maxWidth = minWidth * CGFloat(1.0)
        for vale in self.uniqueElements {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 25)
            label.numberOfLines = 1
            label.text = vale as? String
            label.sizeToFit()
            if label.frame.size.width > maxWidth {
                maxWidth = label.frame.size.width + 20
            }
        }
       return maxWidth
    }
}

// MARK: - UIColor extension
extension UIColor {
    ///
    static var gradientRightSkyColor: UIColor {
        return UIColor(red: 37/255, green: 184/255, blue: 235/255, alpha: 1.0)
    }
    ///
    static var gradientLeftSkyColor: UIColor {
        return UIColor(red: 179/255, green: 227/255, blue: 250/255, alpha: 1.0)
    }
}

