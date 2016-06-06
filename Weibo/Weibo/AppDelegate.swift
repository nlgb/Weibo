//
//  AppDelegate.swift
//  Weibo
//
//  Created by sw on 16/6/5.
//  Copyright © 2016年 sw. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = MainViewController()
        window?.backgroundColor = UIColor.whiteColor()
        window?.makeKeyAndVisible()
        WSLog(10086)

        return true
    }
}
/*
// 以下的写法在Swift3.0中将被废弃，改为#line这种写法
print(__LINE__) // 打印行号
print(__FUNCTION__) // 打印函数名
print(__FILE__) // 打印文件路径
*/
func WSLog<T>(message: T, file:String = #file, method:String = #function, line: Int = #line) {
    #if DEBUG
    print("\(method)[\(line)]: \(message)")
    #endif
}

