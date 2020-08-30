//
// File: JFPlistLoader.swift
// DATE: 2020/8/3
// USER: Jeffy

/// NOTE: 

// Copyright © 2020 Jeffy. All rights reserved.
//

import Foundation

public protocol PlistValueType {}

extension String: PlistValueType {}
extension URL: PlistValueType {}
extension NSNumber: PlistValueType {}
extension Int: PlistValueType {}
extension Float: PlistValueType {}
extension Double: PlistValueType {}
extension Bool: PlistValueType {}
extension Date: PlistValueType {}
extension Data: PlistValueType {}
extension Array: PlistValueType {}
extension Dictionary: PlistValueType {}

/// Extend this class and add your plist keys as static constants (e.g. ` static let somekey = PlistKey<String>("some")`)
/// so you can use the shortcut dot notation (e.g. ` JFPlistLoader.get(.yourKey)`)

open class PlistKeys {}

public final class PlistKey<ValueType: PlistValueType>: PlistKeys {
    
    public let key: String
    
    public init(_ key: String) {
        self.key = key
    }
    
}


public struct JFPlistLoader {
    
    private let dictionary: NSDictionary
    
    public init?(plistPath: String) {
        guard let plist = NSDictionary(contentsOfFile: plistPath) else {
            assertionFailure("could not read plist file.")
            return nil
        }
        dictionary = plist
    }
    
    public func get<T>(_ key: PlistKey<T>) -> T? {
        
        let object = dictionary[key.key] as AnyObject

        let optionalValue: T?
        
        switch T.self {
        case is Int.Type:
            optionalValue = object as? T
        case is Float.Type:
            optionalValue = object.floatValue as? T
        case is Double.Type:
            optionalValue = object.doubleValue as? T
        case is URL.Type:
            optionalValue = URL(string: (object as? String) ?? "") as? T
        default:
            optionalValue = object as? T
        }
        
        guard let value = optionalValue else {
            assertionFailure("Could not cast value of type \(type(of: object)) to \(T.self)")
            return nil
        }
        
        return value
    }
    
}

