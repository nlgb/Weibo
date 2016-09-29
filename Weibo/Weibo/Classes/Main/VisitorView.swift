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
        setupUI()
    }
    
    // 通过xib/SB创建一个控件就会调用
    // 在Swift中, 为了简化业务逻辑, 默认情况下如果说自定义一个View, 那么建议要么是自定义代码的, 要么是自定义XIB/SB
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        // 添加子控件
        addSubview(homeIcon)
        addSubview(maskImageView)
        addSubview(icon)
        addSubview(title)
        addSubview(registerButton)
        addSubview(loginButton)
        // 布局子控件
        homeIcon.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        icon.snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(15)
        }
        title.snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(homeIcon.snp_bottom).offset(15)
            make.width.equalTo(225)
        }
        registerButton.snp_makeConstraints { (make) in
            make.left.equalTo(title)
            make.top.equalTo(title.snp_bottom).offset(15)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        loginButton.snp_makeConstraints { (make) in
            make.right.equalTo(title)
            make.top.equalTo(title.snp_bottom).offset(15)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        maskImageView.snp_makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(registerButton.snp_top)
        }
        // view 的背景色
        backgroundColor = UIColor(white: 235.0/255.0, alpha: 1.0)
    }
    
    // MARK:懒加载
    private lazy var homeIcon : UIImageView = UIImageView(image:UIImage(named:"visitordiscover_feed_image_smallicon"))
    private lazy var icon : UIImageView = UIImageView(image: UIImage(named:"visitordiscover_feed_image_house"))
    private lazy var title : UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.text = "sdfgfddfffgdghjgfdsfghffgdghjgfdsfghffgdghjgfdsfgh"
        lb.textAlignment = NSTextAlignment.Center
        lb.textColor = UIColor.lightGrayColor()
        return lb
    }()
    private lazy var registerButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("注册", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named:"common_button_white_disable"), forState: UIControlState.Normal)
        return btn
    }()
    
    private lazy var loginButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("登录", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named:"common_button_white_disable"), forState: UIControlState.Normal)
        return btn
    }()
    private lazy var maskImageView : UIImageView = UIImageView(image: UIImage(named:"visitordiscover_feed_mask_smallicon"))
    
}
