//
//  PasswordInputViewController.swift
//  QRcode_L1
//
//  Created by HankTseng on 2018/2/4.
//  Copyright © 2018年 HankTseng. All rights reserved.
//

import UIKit

class PasswordInputViewController: UIViewController {

    
    @IBOutlet weak var accountTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    var account = ""
    var password = ""
    
    
    @IBAction func pressLogin(_ sender: UIButton) {
        account = accountTextField.text ?? "no account"
        password = passwordTextField.text ?? "no password"
        sendLoginToServer(withAccount: account, andPassword: password)
    }
    
    
    @IBAction func pressRegist(_ sender: UIButton) {
        account = accountTextField.text!
        password = passwordTextField.text!
    }
    
    func sendLoginToServer(withAccount account: String, andPassword password: String) {
        //send to server
        print("account: \(account), password: \(password)")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }



}
