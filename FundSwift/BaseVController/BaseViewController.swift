//
//  BaseViewController.swift
//  FundSwift
//
//  Created by D on 2019/6/10.
//  Copyright © 2019 D. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    lazy var navBar = CustomNavigationBar.CustomNavBar()
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        //
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.isHidden = true
        automaticallyAdjustsScrollViewInsets = false
        setupNavBar()
    }
    
    fileprivate func setupNavBar()
    {
        
        view.addSubview(navBar)
        
        // 设置自定义导航栏背景图片
        navBar.barBackgroundImage = UIImage(named: "millcolorGrad")
        
        // 设置自定义导航栏背景颜色
        // navBar.backgroundColor = MainNavBarColor
        
        // 设置自定义导航栏标题颜色
        navBar.titleLabelColor = .white
        
        // 设置自定义导航栏左右按钮字体颜色
        navBar.setTintColor(color: .white)
        
        if self.navigationController?.children.count != 1 {
            navBar.setLeftButton(title: "<<", titleColor: UIColor.white)
        }
    }
    
    @objc fileprivate func back()
    {
        _ = navigationController?.popViewController(animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BaseViewController
{
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        pushViewController(viewController, animated: animated)
    }
}
