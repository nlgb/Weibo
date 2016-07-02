//
//  MainViewController.swift
//  Weibo
//
//  Created by sw on 16/6/6.
//  Copyright © 2016年 sw. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // addChildViewController(HomeTableViewController(), image: "tabbar_home", highLightImage: "tabbar_home_highlighted", title: "首页")
        // addChildViewController(MessageTableViewController(), image: "tabbar_message_center", highLightImage: "tabbar_message_center_highlighted", title: "消息")
        // addChildViewController(DiscoverTableViewController(), image: "tabbar_discover", highLightImage: "tabbar_discover_highlighted", title: "发现")
        // addChildViewController(ProfileTableViewController(), image: "tabbar_profile", highLightImage: "tabbar_profile_highlighted", title: "我")
        
        let path = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil)!
        let data = NSData.init(contentsOfFile: path)!
        
        do{
            let dicArr = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
            for dic in dicArr as! [[String:AnyObject]]
            {
                addChildViewController(dic["vcName"] as? String, image: dic["imageName"] as? String, highLightImage: (dic["imageName"] as? String)! + "_highlighted", title: dic["title"] as? String)
            }
        } catch{
            addChildViewController("HomeTableViewController", image: "tabbar_home", highLightImage: "tabbar_home_highlighted", title: "首页")
            addChildViewController("MessageTableViewController", image: "tabbar_message_center", highLightImage: "tabbar_message_center_highlighted", title: "消息")
            addChildViewController("DiscoverTableViewController", image: "tabbar_discover", highLightImage: "tabbar_discover_highlighted", title: "发现")
            addChildViewController("ProfileTableViewController", image: "tabbar_profile", highLightImage: "tabbar_profile_highlighted", title: "我")
        }
    }




    // MARK: 内部控制方法
    func addChildViewController(childControllerName: String?, image: String?, highLightImage: String?, title:String?) {
        
        let nameSpace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"]
        // 可选绑定
        guard let ns = nameSpace as? String else {
            WSLog("命名空间不存在")
            return
        }
        //if let ns = nameSpace as? String {
        guard let vcName = childControllerName else {
            WSLog("控制器名称不能为nil")
            return
        }
        let cls : AnyClass? = NSClassFromString(ns + "." + vcName)
        // AnyClass本质是AnyObject.Type类型
        // UIViewController本质是UIViewController.Type类型
        // 将AnyClass转为UIViewController类型 
        // 类型绑定：如果是这个类型，那么就执行{}内部代码，否则不执行
        // 不安全：let clsType = cls as! UIViewController.Type 直接将结果强转成UIViewController类型
        guard let clsType = cls as? UIViewController.Type else {
            WSLog("传入的字符串不能到最UIViewController来使用")
            return
        }
        // if let clsType = cls as? UIViewController.Type {
            let childController = clsType.init()
            WSLog(childController)
            
            // 如果是在iOS8以前，只有文字有效果，而图片没效果
            tabBar.tintColor = UIColor.orangeColor()
            // 控制器选项卡属性
        guard let iName = image else {
            return
        }
            childController.tabBarItem.image = UIImage(named: iName)
        guard let highIName = highLightImage else {
            return
        }
            childController.tabBarItem.selectedImage = UIImage(named: highIName)
        guard let titleName = title else {
            return
        }
            childController.title = titleName
            // 包装导航控制器
            let  nav = UINavigationController(rootViewController: childController)
            // 添加子控制器
            addChildViewController(nav)
            // }
        // }
    }

    
//    // MARK: 内部控制方法
//    func addChildViewController(childController:UIViewController, image: String, highLightImage: String, title:String) {
//        // 如果是在iOS8以前，只有文字有效果，而图片没效果
//        tabBar.tintColor = UIColor.orangeColor()
//        // 控制器选项卡属性
//        childController.tabBarItem.image = UIImage(named: image)
//        childController.tabBarItem.selectedImage = UIImage(named: highLightImage)
//        childController.title = title
//        // childController.tabBarItem.title = title;
//        // childController.navigationItem.title = title;
//        // 包装导航控制器
//        let  nav = UINavigationController(rootViewController: childController)
//        // 添加子控制器
//        addChildViewController(nav)
//    }
}
