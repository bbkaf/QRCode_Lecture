//
//  ViewController.swift
//  QRcode_L1
//
//  Created by HankTseng on 2018/1/25.
//  Copyright © 2018年 HankTseng. All rights reserved.
//

import UIKit

/*ViewController這個class 繼承自 UIViewController，並用 "," 來加入 ViewController 所必須 confirm 的 protocol，我們的例子就是 UITableViewDelegate 與 UITableViewDataSource (用,來區隔)
請試試壓著 ctrl 與 command 出現手指的圖示後點擊 UITableViewDelegate 與 UITableViewDataSource */
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - IBOutlet
    //將我們 storyboard 的 tableView 拉到 viewController 裡面生成 IBOutlet，weak 詞綴下次會講
    @IBOutlet weak var myTableView: UITableView!
    
    //將我們 storyboard 的 tableView 的高度 constraint 拉到 viewController 裡面生成 IBOutlet，weak 詞綴下次會講
    @IBOutlet weak var constraintOfTableHeight: NSLayoutConstraint!
    
    
    //MARK: - Property
    //創建一個名為 name 的 String type 變數，試試看 Swift 的 type inference，試試看壓住 option 將指標移到 name 上面可以看到他 type
    var name = "hank"
    
    //創建一個名為 anotherName 的 String type 變數
    var anotherName: String = "John"
    
    //創建一個名為 number 的 Int type 變數
    var number = 50
    
    //創建一個名為 userData 的 Array，試試看壓住 option 將指標移到 userData 上面可以看到他 type
    var userData = ["員工編號","員工姓名","聯絡電話","員工部門"]
    
    //創建一個名為 userMoney 的 Array，試試看壓住 option 將指標移到 userMoney 上面可以看到他 type
    var userMoney = [5,10,3,100]
    
    
    //viewDidLoad 是 viewController的 lifecycle，當我們的viewController 進入該 viewDidLoad lifecycle 時會呼叫這個方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //將我們的 myTableView delegate 設為自己 (self 就是指這個 ViewController class)，意思可以理解為這個 ViewController 會負責控制 myTableView (透過下面的 UITableViewDataSource delegate methode)
        myTableView.delegate = self
        
        //將我們的 myTableView dataSource 設為自己 (self 就是指這個 ViewController class)，意思可以理解為這個 ViewController 會負責控制 myTableView (透過下面的 UITableViewDataSource delegate methode)
        myTableView.dataSource = self
    }

    //viewWillLayoutSubviews 是 viewController的 lifecycle，當我們的viewController 進入該 viewWillLayoutSubviews lifecycle 時會呼叫這個方法
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //我們在這邊參與 autolayout 並將 constraintOfTableHeight 設定為他的 contentSize.height (適合他內容的高度)
        constraintOfTableHeight.constant = myTableView.contentSize.height
    }
    

    //MARK: - UITableViewDataSource delegate methode
    
    //這是 UITableViewDataSource protocol 的必須實作方法 (非 optional)，當我們宣告某某 class confirm 某某 protocol 時就必須實作這個 protocol 的必須項目 (請看code第13行)，這邊可能會疑惑的是 func 的結構，我下週會詳細講
    //numberOfRowsInSection 必須返回(return)一個 Int (語法: -> Int) 告訴tableView 我們要顯示的cell有幾個
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //令一個常數 number 值為我們要顯示的cell數量，也就是 userData 裡面所含有的 item 數量，用 .count 語法來取得他的數量
        let number = userData.count
        
        //將這個常數 number 最為返回值 retuen 出去
        return number
    }
    
    //這是 UITableViewDataSource protocol 的必須實作方法 (非 optional)，當我們宣告某某 class confirm 某某 protocol 時就必須實作這個 protocol 的必須項目 (請看code第13行)，這邊可能會疑惑的是 func 的結構，我下週會詳細講
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //令一個常數名字為 cell 並用 tableView.dequeueReusableCell 來指定我們要用的 cell 的 identifier 與 indexPath，這邊可能會疑惑的是 func 的結構，我下週會詳細講
        //這邊的 tableView 就是我們在 storyboard 上拉到 viewController 的 tableView
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        //令一個常數名字為 titleName 而每個 cell 的 titleName 分別依序為 userData 裡面的各個 item，用 [indexPath.row] 語法來取得 userData 裡面的各個成員 userData[0] userData[1] userData[2] userData[3]
        let titleName = userData[indexPath.row]
        
        //將 titleName 賦值給 cell 的 textLabel 上面的文字，用.textLabel?.text 語法 (為什麼有 optional ("?") 下週我會詳細講)
        cell.textLabel?.text = titleName
        
        //把這個 cell 返回出去，請看第75行  -> UITableViewCell ，代表這個 func 要返回一個 UITableViewCell type 的物件，再壓住 option 點擊78行我們令的常數 cell，看看他是什麼type，問什麼會是 UITableViewCell，因為 dequeueReusableCell 這個方法(壓住option點擊第78行的dequeueReusableCell方法，可以看到個方法 -> UITableViewCell，也就是 return 一個 UITableViewCell type 值給我們的cell)
        return cell
    }

}
