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
    
    var userData: [String: String] = [:]
    
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
            if let data = response.data {
                self.userData = data
            }
            if response.returnCode == "1" {
                //storeUserPassword
                //UserDefaults.standard.set(account, forKey: "account")
                //UserDefaults.standard.set(password, forKey: "password")
                //segue
                self.performSegue(withIdentifier: "segueToAccountInfoVC", sender: nil)
            }
            
        }
        
    }
    
    
    func sendRegistInfoToServer(withAccount account: String, andPassword password: String) {
        FirebaseServer.shared.regist(withAccount: account, password: password) { (response) in
            print(response.returnCode)
            print(response.message)
            print(response.data)
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let accountInfoVC = segue.destination as? AccountInfoViewController {
            accountInfoVC.userData = self.userData
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.accountTextField.text = UserDefaults.standard.object(forKey: "account") as? String ?? ""
        //self.passwordTextField.text = UserDefaults.standard.object(forKey: "password") as? String ?? ""
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



