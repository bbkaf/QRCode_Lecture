//
//  LoginViewController.swift
//  QRcode_L1
//
//  Created by HankTseng on 2018/2/4.
//  Copyright © 2018年 HankTseng. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var accountTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func pressLogin(_ sender: UIButton) {
        sendLoginInfoToServer(withAccount: accountTextField.text!, andPassword: passwordTextField.text!)
    }
    
    @IBAction func pressRegist(_ sender: UIButton) {
        sendRegistInfoToServer(withAccount: accountTextField.text!, andPassword: passwordTextField.text!)
    }
    
    
    func sendLoginInfoToServer(withAccount account: String, andPassword password: String) {
        FirebaseServer.shared.login(withAccount: account, password: password) { (response) in
            print(response.returnCode)
            print(response.message)
            print(response.data)
        }
        
    }
    
    func sendRegistInfoToServer(withAccount account: String, andPassword password: String) {
        FirebaseServer.shared.regist(withAccount: account, password: password) { (response) in
            print(response.returnCode)
            print(response.message)
            print(response.data)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().signInAnonymously { (user, error) in
            if error != nil {
                print("error happen in \(String(describing: user)), \(String(describing: error))")
            } else {
                let uid = user?.uid
                print("login with uid: \(String(describing: uid))")
            }
        }
    }
}

