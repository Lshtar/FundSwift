//
//  MainTabBarViewController.swift
//  FundSwift
//
//  Created by D on 2019/6/10.
//  Copyright © 2019 D. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //
        addChildViewControllers()
    }
    
    private func addChildViewControllers(){
        
        addChildViewController(childControllerName: "HomeViewController", title: "首页", imageName: "wode_b")
        addChildViewController(childControllerName: "DiscoverViewController", title: "发现", imageName: "wode_b")
        addChildViewController(childControllerName: "ProductViewController", title: "产品", imageName: "wode_b")
        addChildViewController(childControllerName: "MineViewController", title: "我的", imageName: "wode_b")
    }
    
    private func addChildViewController(childControllerName:String, title:String, imageName:String){
        
        let ns = Bundle.main.infoDictionary!["CFBundleExecutable"]as! String
        let cls:AnyClass? = NSClassFromString(ns+"." + childControllerName)
        let vcCls = cls as!BaseViewController.Type
        let vc = vcCls.init()
        
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName+"highlighted")
        vc.title = title
        
        let nav = UINavigationController()
        nav.addChild(vc)
        
        addChild(nav)
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
