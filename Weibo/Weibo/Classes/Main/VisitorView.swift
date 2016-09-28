//
//  VisitorView.swift
//  Weibo
//
//  Created by sw on 16/9/28.
//  Copyright © 2016年 sw. All rights reserved.
//

import UIKit
import SnapKit

class VisitorView: UIView {

    // 通过代码创建一个控件就会调用
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // 通过xib/SB创建一个控件就会调用
    // 在Swift中, 为了简化业务逻辑, 默认情况下如果说自定义一个View, 那么建议要么是自定义代码的, 要么是自定义XIB/SB
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        
    }
    
    // MARK:懒加载
    private lazy var homeIcon : UIImageView = UIImageView(image:UIImage(named:""))
    private lazy var icon : UIImageView = UIImageView(image: UIImage(named:""))
    private lazy var title : UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.text = "sdfgfddfffgdghjgfdsfgh"
        lb.textColor = UIColor.lightGrayColor()
        return lb
    }()
    private lazy var registerButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("注册", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named:""), forState: UIControlState.Normal)
        return btn
    }()
    
    private lazy var loginButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("登录", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named:""), forState: UIControlState.Normal)
        return btn
    }()
    private lazy var askImageView : UIImageView = UIImageView(image: UIImage(named:""))
    
}
