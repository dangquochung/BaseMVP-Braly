//
//  UserDefaultsService.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import UIKit

protocol UserDefaultsServiceProtocol {
    func checkKey(suiteName: String, key: String) -> Bool
    func removeKey(suiteName: String, key: String)
    func setString(suiteName: String, value: String, key: String)
    func setInterger(suiteName: String, value: Int, key: String)
    func setFloat(suiteName: String, value: Float, key: String)
    func stringValue(suiteName: String, key: String) -> String?
    func intValue(suiteName: String, key: String) -> Int?
    func floatValue(suiteName:String, key: String) -> Float?
    func setBool(value: Bool, key: String)
    func boolValue(key: String) -> Bool
    func setFloatArray(key: String, value: [Float])
    func floatArrayValue(key: String) -> [Float]
    func setDoubleArray(key: String, value: [Double])
    func doubleArrayValue(key: String) -> [Double]
}

class UserDefaultsService: UserDefaultsServiceProtocol {

    func setFloat(suiteName: String, value: Float, key: String) {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        defaults?.set(value, forKey: key)
        defaults?.synchronize()
    }

    func floatValue(suiteName: String, key: String) -> Float? {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        return defaults?.float(forKey: key)
    }

    func checkKey(suiteName: String = "", key: String) -> Bool {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        if defaults?.object(forKey: key) != nil {
            return true
        }
        return false
    }

    func removeKey(suiteName: String = "", key: String) {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        if defaults?.object(forKey: key) != nil {
            defaults?.removeObject(forKey: key)
            defaults?.synchronize()
        }
    }

    func setString(suiteName: String = "", value: String, key: String) {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        defaults?.set(value, forKey: key)
        defaults?.synchronize()
    }

    func setInterger(suiteName: String = "", value: Int, key: String) {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        defaults?.set(value, forKey: key)
        defaults?.synchronize()
    }

    func stringValue(suiteName: String = "", key: String) -> String? {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        return defaults?.string(forKey: key)
    }

    func intValue(suiteName: String = "", key: String) -> Int? {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        return defaults?.integer(forKey: key)
    }

    func setBool(value: Bool, key: String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }

    func boolValue(key: String) -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: key)
    }

    func setFloatArray(key: String, value: [Float]) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }

    func floatArrayValue(key: String) -> [Float] {
        let defaults = UserDefaults.standard
        return defaults.array(forKey: key) as? [Float] ?? [Float]()
    }

    func setDoubleArray(key: String, value: [Double]) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }

    func doubleArrayValue(key: String) -> [Double] {
        let defaults = UserDefaults.standard
        return defaults.array(forKey: key) as? [Double] ?? [Double]()
    }
}
