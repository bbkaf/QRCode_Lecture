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
    var userData = ["員工編號","員工姓名","聯絡電話","員工部門"]
    var employeeData = [[String: String]]()
    var name = ""
    var phone = ""
    var gender = ""
    var dep = ""
    
    
    //var identifierCardMaker: IdentifierCardMaker = IdentifierCardMaker()
    //try lazy: class property must be fully initialize before we can use it, when we call identifierCardMaker we input an property also in the initialize state so we must add lazy. lazy means the var won't be init till be called.
    lazy var identifierCardMaker = IdentifierCardMaker(employeeDataDic: employeeData)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        constraintOfTableHeight.constant = myTableView.contentSize.height
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        employeeData = [["name": "hank",
                         "phone": "0932781720",
                         "gender": "male",
                         "dep": "IT"]]
        
        identifierCardMaker = IdentifierCardMaker(employeeDataDic: employeeData)
        print(identifierCardMaker.employees)
    }
    
    
    
 
    //MARK: - UITableViewDataSource delegate methode
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let titleName = userData[indexPath.row]
        cell.textLabel?.text = titleName
        return cell
    }
    
}
