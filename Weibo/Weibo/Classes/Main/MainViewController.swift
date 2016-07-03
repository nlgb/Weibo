//
//  MainViewController.swift
//  Weibo
//
//  Created by sw on 16/6/6.
//  Copyright © 2016年 sw. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    // MARK: 生命周期方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加所有子控制器
        addChildViewControllers()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // 初始化加号按钮
        setupComposeBtn()
    }
    
    // MARK: 初始化加号按钮
    private func setupComposeBtn() {
        // 把加号按钮添加到tabBar上
        tabBar.addSubview(composeButton)
        // 设置宽度
        // let width = tabBar.itemWidth
        let width = tabBar.bounds.width / CGFloat(childViewControllers.count)
        // 设置高度
        let height = tabBar.frame.size.height
        // 修改frame
        let rect = CGRect(origin:CGPointZero, size:CGSize(width:width, height:height))
        composeButton.frame = CGRectOffset(rect, 2 * width, 0)
    }
    
    // MARK: 添加所有子控制器
    private func addChildViewControllers() {
        
        /*
        // addChildViewController(HomeTableViewController(), image: "tabbar_home", highLightImage: "tabbar_home_highlighted", title: "首页")
        // addChildViewController(MessageTableViewController(), image: "tabbar_message_center", highLightImage: "tabbar_message_center_highlighted", title: "消息")
        // addChildViewController(DiscoverTableViewController(), image: "tabbar_discover", highLightImage: "tabbar_discover_highlighted", title: "发现")
        // addChildViewController(ProfileTableViewController(), image: "tabbar_profile", highLightImage: "tabbar_profile_highlighted", title: "我")
        */
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
            addChildViewController("NullViewController", image: "", highLightImage: "", title: "")
            addChildViewController("DiscoverTableViewController", image: "tabbar_discover", highLightImage: "tabbar_discover_highlighted", title: "发现")
            addChildViewController("ProfileTableViewController", image: "tabbar_profile", highLightImage: "tabbar_profile_highlighted", title: "我")
        }
    }

    // MARK: 创建子控制器
    private func addChildViewController(childControllerName: String?, image: String?, highLightImage: String?, title:String?) {
        
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
    
    // MARK: 懒加载发布按钮

    
    private lazy var composeButton: UIButton = {
        
        var btn = UIButton(imageName: "tabbar_compose_icon_add", backImageName: "tabbar_compose_button")
        btn.addTarget(self, action: Selector("composeBtnClick"), forControlEvents: UIControlEvents.TouchUpInside)
        return btn
        
        /*
        var btn = UIButton.create("tabbar_compose_icon_add", backImageName: "tabbar_compose_button")
        btn.addTarget(self, action: Selector("composeBtnClick"), forControlEvents: UIControlEvents.TouchUpInside)
        return btn
        */
        /*
        var btn = UIButton()
        // 1.设置背景图片
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        // 2.设置前景图片
        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        // 3.监听按钮点击
        btn.addTarget(self, action: Selector("composeBtnClick"), forControlEvents: UIControlEvents.TouchUpInside)
        
        return btn
         */
        
    }()
    
    //MARK: 监听按钮点击
    // 注意: 由于点击事件是由NSRunLoop发起的, 并不是当前类发起的, 所以如果在点击方法前面加上private, 那么NSRunLoop无法找到该方法
    // OC是基于运行时动态派发事件的, 而Swift是编译时就已经确定了方法
    // 如果想给监听点击的方法加上private, 并且又想让系统动态派发时能找到这个方法, 那么可以在前面加上@objc, @objc就能让这个方法支持动态派发

    @objc private func composeBtnClick() {
        WSLog("点击了写作按钮")
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
