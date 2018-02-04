//
//  FirebaseServer.swift
//  QRcode_L1
//
//  Created by HankTseng on 2018/2/4.
//  Copyright © 2018年 HankTseng. All rights reserved.
//

import Foundation
import Firebase

class FirebaseServer {
    static let shared = FirebaseServer()
    let rootRef = Database.database().reference()
    var accountRef = Database.database().reference()
    let firebaseProjectURL = "https://qrcodelecture.firebaseio.com/"
    private let concurrentQueue = DispatchQueue(label: "com.lecture.qrcode")
    var isRun = false
    init() {
        print("init")
        rootRef.database.reference(fromURL: firebaseProjectURL)
    }
    
    func regist(withAccount account: String, password: String) { //[todo] escaping
        print(isRun)
        if !isRun {
            isRun = true
            let dataQuery = rootRef.queryLimited(toLast: 500)
            dataQuery.observeSingleEvent(of: .value) { (snapShot) in
                var isExist = false
                if let downloadData = snapShot.value as? [String: AnyObject] {
                    for data in downloadData {
                        let accountInfoDic = data.value as! [String: String]
                        if accountInfoDic["account"] == account {
                            print("account exist")
                            self.isRun = false
                            isExist = true
                            return
                        }
                    }
                }
                
                if !isExist {
                    print("add account")
                    self.accountRef = self.rootRef.childByAutoId()
                    let updataValue = ["account": account,
                                       "password": password,
                                       "time": Utility.shared.stringFromDate(Date()),
                                       "deviceModel": Utility.shared.getDeviceModelName(),
                                       "DeviceUDID": UIDevice.current.identifierForVendor?.uuidString,
                                       "isVerified": "false"
                    ]
                    self.accountRef.setValue(updataValue)
                }
                self.isRun = false
            }
        }
        
    }
    
    func login(withAccount account: String, password: String) { //[todo] escaping
        print(isRun)
        if !isRun {
            isRun = true
            let dataQuery = rootRef.queryLimited(toLast: 500)
            dataQuery.observeSingleEvent(of: .value) { (snapShot) in
                if let downloadData = snapShot.value as? [String: AnyObject] {
                    for data in downloadData {
                        let accountInfoDic = data.value as! [String: String]
                        if accountInfoDic["account"] == account {
                            if accountInfoDic["isVerified"] == "true" {
                                print("account is valid, login now...")
                            } else {
                                print("account is not valid")
                            }
                            self.isRun = false
                            return
                        }
                    }
                    print("account not exist")
                }
                
                self.isRun = false
            }
        }
    }
}
