//
//  BaseTableViewController.swift
//  Weibo
//
//  Created by sw on 16/7/9.
//  Copyright © 2016年 sw. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
    
    // 定义标记，记录当前用户是否登录
    var login : Bool = false

    override func loadView() {
        login ? super.loadView() : setupVisitirView()
    }

    // 初始化未登录页面
    private func setupVisitirView() {
        view = VisitorView()
    }
}
