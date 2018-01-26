//
//  ViewController.swift
//  QRcode_L1
//
//  Created by HankTseng on 2018/1/25.
//  Copyright © 2018年 HankTseng. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - IBOutlet
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var constraintOfTableHeight: NSLayoutConstraint!
    
    //MARK: - Property
    var name = "hank"
    var number = 50
    
    
    var userData = ["員工編號","員工姓名","聯絡電話","員工部門"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        constraintOfTableHeight.constant = myTableView.contentSize.height
    }
    
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        self.constraintOfTableHeight?.constant = self.myTableView.contentSize.height
//    }

    //MARK: - UITableViewDataSource delegate methode
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let number = userData.count
        return number
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let titleName = userData[indexPath.row]
        cell.textLabel?.text = titleName
        return cell
    }

    
    
}







































