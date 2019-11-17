//
//  StorageService.swift
//  WebserviceExample
//
//  Created by Admin on 16/11/19.
//  Copyright © 2019 Piyush. All rights reserved.
//
import Foundation
// this class is used to store data to user default and fetch from user default for whole project
class StorageService {
    
    // MARK: - Variables
    
    /// sharing class Preference
    static let shared = StorageService()
    
    ///  interface for interacting with the defaults system
    let userdefault = UserDefaults.standard
    
    /// isLogin is used to check login
    var isLogin: Bool? {
        get {
            return userdefault.value(forKey: UserDefaults.DefaultKeys.isLogin) as? Bool
        }
        set {
            if let stadium = newValue {
                userdefault.set(stadium, forKey: UserDefaults.DefaultKeys.isLogin)
            } else {
                userdefault.removeObject(forKey: UserDefaults.DefaultKeys.isLogin)
            }
            userdefault.synchronize()
        }
    }
    
    ///
    var strToken: String? {
        get {
            return userdefault.value(forKey: UserDefaults.DefaultKeys.token) as? String
        }
        set {
            if let stadium = newValue {
                userdefault.set(stadium, forKey: UserDefaults.DefaultKeys.token)
            } else {
                userdefault.removeObject(forKey: UserDefaults.DefaultKeys.token)
            }
            userdefault.synchronize()
        }
    }
    
    //    /// projectListArray is used to get or save data of userDetails in userdefault
    //    var projectListArray: [Project]? {
    //        get {
    //            guard let decoded = userdefault.value(forKey: UserDefaults.DefaultKeys.projectList) as? Data, let decodedModel =  NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [Project] else {
    //                return nil
    //            }
    //            return decodedModel
    //        }
    //        set {
    //            if let stadium = newValue {
    //                let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: stadium)
    //                userdefault.set(encodedData, forKey: UserDefaults.DefaultKeys.projectList)
    //            } else {
    //                userdefault.removeObject(forKey: UserDefaults.DefaultKeys.projectList)
    //            }
    //            userdefault.synchronize()
    //        }
    //    }
    
    /// loginDetail is used to get or save data of userDetails in userdefault
    var loginDetail: LoginModel? {
        get {
            let loginModel: LoginModel? = StorageService.get(for: UserDefaults.DefaultKeys.loginDetail)
            return loginModel
        } set {
            StorageService.save(newValue, for: UserDefaults.DefaultKeys.loginDetail)
        }
    }
    
    // MARK: - Remove login Data
    
    /// clean login details from userdefault and local
    func cleanLoginDetails() {
        loginDetail = nil
        isLogin = false
        loginDetail = nil
    }
    
    /// removeAllKeysFromUserDefaults is used to remove all stored keys from userDefault
    func removeAllKeysFromUserDefaults() {
        if let appDomain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: appDomain)
        }
    }
    
    // MARK: - Private Methods
    
    /// these are generic reusable methods not available outside this class
    
    /// Call to save object data in local storage.
    /// Use This function for storing items that don't have their own built-in storage method
    /// and objects that are not simple PList objects.
    /// Bool, URL, Dictionary, Array, [String], Int, Float, Data all have their own built-in
    /// methods, the rest we store as objects of type (`Any?`)
    ///
    /// - Parameters:
    ///   - object: The object data to be stored.
    ///   - key: The key used to get and set the value
    private static func save<T: Codable>(_ object: T, for key: String) {
        // create an encoder to encode the object to data
        let encoder = JSONEncoder()
        
        do {
            // encode and store
            let data = try encoder.encode(object)
            UserDefaults.standard.set(data, forKey: key)
        } catch let error {
            // encoding failed
            print("error encoding: \(error)")
        }
    }
    
    /// Call to retrieve previously stored object data from UserDefaults
    ///
    /// - Parameter key: The key used to get and set the value
    /// - Returns: Optional object of the specified type `T` (e.g. String?, User?) or nil if not found
    private static func get<T: Codable>(for key: String) -> T? {
        // if we do not find the saved data, return nil
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        // the saved data was found so create a decoder to decode it
        let decoder = JSONDecoder()
        do {
            // decode the retrieved data to specified type
            return try decoder.decode(T.self, from: data)
        } catch let error {
            // decoding failed; return nil
            print("error decoding: \(error)")
            return nil
        }
    }
    
}
// MARK: - UserDefaults Extension
extension UserDefaults {
    // MARK: - DefaultKeys Name
    struct DefaultKeys {
        ///
        static let token = "Token"
        ///
        static let isLogin = "IsLogin"
        ///
        static let loginDetail = "LoginDetail"
        ///
        static let projectList = "ProjectList"
    }
}
