
//
//  UIButton+Extension.swift
//  Weibo
//
//  Created by sw on 16/7/3.
//  Copyright © 2016年 sw. All rights reserved.
//

import UIKit

extension UIButton {
    // 虽然以下方法可以快速创建一个UIButton对象, 但是Swift风格不是这样写的
    // 在Swift开发中, 如果想快速创建一个对象, 那么可以提供一个便利构造器(便利构造方法)
    // 只要在普通构造方法前面加上一个convenience, 那么这个构造方法就是一个便利构造方法
    // 注意: 如果定义一个便利构造器, 那么必须在便利构造器中调用指定构造器(没有加convenience单词的构造方法)
    class func create(imageName:String, backImageName:String) ->UIButton {
        let btn = UIButton()
        // 前景图片
        btn.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        // 背景图片
        btn.setBackgroundImage(UIImage(named: backImageName), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: backImageName + "_highlighted"), forState: UIControlState.Highlighted)
        btn.sizeToFit()
        
        return btn
    }
    
    //注意： 便利构造器和普通init构造器一样，没有返回值。所以无需->UIButton
    convenience init(imageName: String, backImageName: String) {
        self.init()
        // 前景图片
        setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        // 背景图片
        setBackgroundImage(UIImage(named: backImageName), forState: UIControlState.Normal)
        setBackgroundImage(UIImage(named: backImageName + "_highlighted"), forState: UIControlState.Highlighted)
        sizeToFit()
        
    }
}