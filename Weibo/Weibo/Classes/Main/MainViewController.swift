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

        addChildViewController(HomeTableViewController(), image: "tabbar_home", highLightImage: "tabbar_home_highlighted", title: "首页")
        addChildViewController(MessageTableViewController(), image: "tabbar_message_center", highLightImage: "tabbar_message_center_highlighted", title: "消息")
        addChildViewController(DiscoverTableViewController(), image: "tabbar_discover", highLightImage: "tabbar_discover_highlighted", title: "发现")
        addChildViewController(ProfileTableViewController(), image: "tabbar_profile", highLightImage: "tabbar_profile_highlighted", title: "我")
    }


    func addChildViewController(childController: UIViewController, image: String, highLightImage: String, title:String) {
        // 如果是在iOS8以前，只有文字有效果，而图片没效果
        tabBar.tintColor = UIColor.orangeColor()
        UIImage().imageWithRenderingMode(<#T##renderingMode: UIImageRenderingMode##UIImageRenderingMode#>)
        // 控制器选项卡属性
        childController.tabBarItem.image = UIImage(named: image)
        childController.tabBarItem.selectedImage = UIImage(named: highLightImage)
        childController.title = title
        // childController.tabBarItem.title = title;
        // childController.navigationItem.title = title;
        // 包装导航控制器
        let  nav = UINavigationController(rootViewController: childController)
        // 添加子控制器
        addChildViewController(nav)
    }
}
