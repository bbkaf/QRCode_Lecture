//
//  LoginViewController.swift
//  QRcode_L1
//
//  Created by HankTseng on 2018/2/4.
//  Copyright © 2018年 HankTseng. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var accountTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func pressLogin(_ sender: UIButton) {
        
        sendLoginInfoToServer(withAccount: accountTextField.text!, andPassword: passwordTextField.text!)

    }
    
    func sendLoginInfoToServer(withAccount account: String, andPassword password: String) {
        //send to server
        print("account: \(account), password: \(password)")
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
