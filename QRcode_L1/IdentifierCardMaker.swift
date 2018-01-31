//
//  IdentifierCardMaker.swift
//  QRcode_L1
//
//  Created by HankTseng on 2018/1/31.
//  Copyright © 2018年 HankTseng. All rights reserved.
//

import Foundation

class IdentifierCardMaker {
    
    //var employees: Array<Employee>
    //var employees: Array<Employee> = Array<Employee>()
    //var employees = Array<Employee>()
    var employees = [Employee]()
    
    
    func makeQrcode(at index: Int) {
        
    }
    
    
    init(employeeDataDic: [[String: String]]) {
        
        //for i in 0..<employeeDataDic.count {
        //for i in employeeDataDic.indices {
        for employeeData in employeeDataDic {
            let employee = Employee(name: employeeData["name"]!, phone: employeeData["phone"]!, gender: employeeData["gender"]!, dep: employeeData["dep"]!)  //try free initializer in of struct
            employees.append(employee)
        }
    }
    
    
    
}
