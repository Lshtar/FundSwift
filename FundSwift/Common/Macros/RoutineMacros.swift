//
//  RoutineMacros.swift
//  FundSwift
//
//  Created by D on 2019/6/27.
//  Copyright © 2019 D. All rights reserved.
//

import Foundation
import UIKit

let Screen_Bounds: CGRect  = UIScreen.main.bounds
let Screen_Width: CGFloat  = UIScreen.main.bounds.width
let Screen_Height: CGFloat = UIScreen.main.bounds.height


let UIPX:CGFloat = Screen_Width/750.0

let Is_Iphone: Bool = (UI_USER_INTERFACE_IDIOM() == .phone)
let Is_Ipad: Bool   = (UI_USER_INTERFACE_IDIOM() == .pad)

let Screen_Max_Length:CGFloat = max(Screen_Width, Screen_Height)
let Screen_Min_Length:CGFloat = min(Screen_Width, Screen_Height)
let Is_IphoneX: Bool          = (Is_Iphone && Screen_Max_Length == 812.0)
let Is_Iphone6P: Bool         = (Is_Iphone && Screen_Max_Length == 736.0)
let Is_Iphone6: Bool          = (Is_Iphone && Screen_Max_Length == 667.0)
let Is_Iphone5: Bool          = (Is_Iphone && Screen_Max_Length == 568.0)
let Is_Iphone5_Less:Bool      = (Is_Iphone && Screen_Max_Length <= 568.0)

let Tabbar_Height: CGFloat       = 49.0
let NaviBar_Height: CGFloat      = 44.0
let Height_IphoneX_Home: CGFloat = (Is_IphoneX ? 34.0 : 0.0)
let StatusBar_Height: CGFloat    = (Is_IphoneX ? 44.0 : 20.0)

/********************** Color **********************/
func RGB(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor.init(red: ((r)/255.0), green: ((g)/255.0), blue: ((b)/255.0), alpha: a)
}

func ColorWithHex(hex: String) -> UIColor! {
    return ColorWithHex(hex: hex, alpha: 1.0)
}

func ColorWithHex(hex: String, alpha: CGFloat) -> UIColor! {
    
    var cString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString = (cString as NSString).substring(from: 1)
    }
    
    if ((cString as NSString).length != 6) {
        return UIColor.gray
    }
    
    let rString = (cString as NSString).substring(to: 2)
    let gString = (cString as NSString).substring(with: NSMakeRange(2, 2))
    let bString = (cString as NSString).substring(with: NSMakeRange(4, 2))
    
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    
    Scanner(string: rString).scanHexInt32(&r)
    Scanner(string: gString).scanHexInt32(&g)
    Scanner(string: bString).scanHexInt32(&b)
    
    return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
}

/********************** Font **********************/
func Font(fontSize: CGFloat) -> UIFont {
    return  UIFont.systemFont(ofSize: fontSize)
}

func BoldFont(fontSize: CGFloat) -> UIFont {
    return  UIFont.boldSystemFont(ofSize: fontSize)
}

