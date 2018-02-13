//
//  AccountInfoViewController.swift
//  QRcode_L1
//
//  Created by HankTseng on 2018/2/9.
//  Copyright © 2018年 HankTseng. All rights reserved.
//

import UIKit

class AccountInfoViewController: UIViewController {

    @IBOutlet weak var myQRCodeImageView: QRCodeImageView!
    var userData: [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("AccountInfoVC viewDidLoad")
        print(userData)
        
        myQRCodeImageView.genQRCode(infoTest: userData["mobilePassword"] ?? "error")

        
    }


    

    

}
