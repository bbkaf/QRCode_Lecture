//
//  FirebaseServer.swift
//  QRcode_L1
//
//  Created by HankTseng on 2018/2/4.
//  Copyright © 2018年 HankTseng. All rights reserved.
//

import Foundation
import Firebase

struct Response {
    var returnCode: String
    var message: String
    var data: [String: String]?
}

class FirebaseServer {
    static let shared = FirebaseServer()
    let rootRef = Database.database().reference()
    var accountRef = Database.database().reference()
    let firebaseProjectURL = "https://qrcodelecture.firebaseio.com/"
    private let concurrentQueue = DispatchQueue(label: "com.lecture.qrcode")
    var isRun = false
    init() {
        rootRef.database.reference(fromURL: firebaseProjectURL)
    }
    
    func regist(withAccount account: String, password: String, completion: @escaping (_ response: Response) -> Void) {
        if !isRun {
            isRun = true
            let dataQuery = rootRef.queryLimited(toLast: 500)
            dataQuery.observeSingleEvent(of: .value) { (snapShot) in
                var isExist = false
                if let downloadData = snapShot.value as? [String: AnyObject] {
                    for data in downloadData {
                        let accountInfoDic = data.value as! [String: String]
                        if accountInfoDic["account"] == account {
                            let response = Response(returnCode: "0", message: "帳號已存在", data: nil)
                            completion(response)
                            self.isRun = false
                            isExist = true
                            return
                        }
                    }
                }
                
                if !isExist {
                    self.accountRef = self.rootRef.childByAutoId()
                    let updataValue = ["account": account,
                                       "password": password,
                                       "time": Utility.shared.stringFromDate(Date()),
                                       "deviceModel": Utility.shared.getDeviceModelName(),
                                       "DeviceUDID": UIDevice.current.identifierForVendor?.uuidString,
                                       "isVerified": "false",
                                       "job": "none",
                                       "autobiography": "none"
                    ]
                    self.accountRef.setValue(updataValue)
                    let response = Response(returnCode: "1", message: "註冊成功", data: nil)
                    completion(response)
                }
                self.isRun = false
            }
        }
    }
    
    func login(withAccount account: String, password: String, completion: @escaping (_ response: Response) -> Void) {
        var accountExist = false
        var passwordValid = false
        var accountValid = false
        if !isRun {
            isRun = true
            let dataQuery = rootRef.queryLimited(toLast: 500)
            dataQuery.observeSingleEvent(of: .value) { (snapShot) in
                if let downloadData = snapShot.value as? [String: AnyObject] {
                    for data in downloadData {
                        let accountInfoDic = data.value as! [String: String]
                        if accountInfoDic["account"] == account {
                            accountExist = true
                            if accountInfoDic["password"] == password {
                                passwordValid = true
                                if accountInfoDic["isVerified"] == "true" {
                                    accountValid = true
                                    let returnData = ["account": accountInfoDic["account"]!,
                                                      "registTime": accountInfoDic["time"]!,
                                                      "registModel": accountInfoDic["deviceModel"]!,
                                                      "currentLoginModel": Utility.shared.getDeviceModelName(),
                                                      "DeviceUDID": accountInfoDic["DeviceUDID"]!,
                                                      "isVerified": accountInfoDic["isVerified"]!,
                                                      "job": accountInfoDic["job"]!,
                                                      "autobiography": accountInfoDic["autobiography"]!
                                    ]
                                    let response = Response(returnCode: "1", message: "account is valid, login now...", data: accountInfoDic)
                                    completion(response)
                                }
                            }
                            self.isRun = false
                        }
                    }
                    if accountExist == true {
                        if passwordValid == true {
                            if accountValid == true {
                            } else {
                                let response = Response(returnCode: "0", message: "帳號審核中", data: nil)
                                completion(response)
                            }
                        } else {
                            let response = Response(returnCode: "-2", message: "密碼錯誤", data: nil)
                            completion(response)
                        }
                    } else {
                        let response = Response(returnCode: "-1", message: "無此帳號", data: nil)
                        completion(response)
                    }
                }
                self.isRun = false
            }
        }
    }
}




