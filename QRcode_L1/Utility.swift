//
//  Utility.swift
//  QRcode_L1
//
//  Created by HankTseng on 2018/2/4.
//  Copyright © 2018年 HankTseng. All rights reserved.
//

import Foundation

class Utility {
    static let shared = Utility()
    
    
    func getDeviceModelName() -> String {
        var sysinfo = utsname ()
        uname ( &sysinfo ) // ignore return value
        
        let machineMirror = Mirror(reflecting: sysinfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        var phoneModel: String
        
        switch identifier {
            //        case "iPod5,1":                                 phoneModel = "iPod Touch 5"
        //        case "iPod7,1":                                  phoneModel = "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":      phoneModel = "iPhone 4"
        case "iPhone4,1":                                phoneModel = "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                   phoneModel = "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                   phoneModel = "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                   phoneModel = "iPhone 5s"
        case "iPhone7,2":                                phoneModel = "iPhone 6"
        case "iPhone7,1":                                phoneModel = "iPhone 6 Plus"
        case "iPhone8,1":                                phoneModel = "iPhone 6s"
        case "iPhone8,2":                                phoneModel = "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                   phoneModel = "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                   phoneModel = "iPhone 7 Plus"
        case "iPhone8,4":                                phoneModel = "iPhone SE"
            //        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": phoneModel = "iPad 2"
            //        case "iPad3,1", "iPad3,2", "iPad3,3":            phoneModel = "iPad 3"
            //        case "iPad3,4", "iPad3,5", "iPad3,6":            phoneModel = "iPad 4"
            //        case "iPad4,1", "iPad4,2", "iPad4,3":            phoneModel = "iPad Air"
            //        case "iPad5,3", "iPad5,4":                       phoneModel = "iPad Air 2"
            //        case "iPad2,5", "iPad2,6", "iPad2,7":            phoneModel = "iPad Mini"
            //        case "iPad4,4", "iPad4,5", "iPad4,6":            phoneModel = "iPad Mini 2"
            //        case "iPad4,7", "iPad4,8", "iPad4,9":            phoneModel = "iPad Mini 3"
            //        case "iPad5,1", "iPad5,2":                       phoneModel = "iPad Mini 4"
            //        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8": phoneModel = "iPad Pro"
        //        case "AppleTV5,3":                               phoneModel = "Apple TV"
        case "i386", "x86_64":                           phoneModel = "Simulator"
        default:                                         phoneModel = identifier
        }
        return phoneModel
    }
    
    func stringFromDate(_ time: Date) -> String {
        let formatter = Foundation.DateFormatter()
        formatter.timeZone = TimeZone.autoupdatingCurrent
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let stringOfDate = formatter.string(from: time)
        return stringOfDate
    }
    
    
    
}
