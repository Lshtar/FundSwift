//
//  Banner.swift
//  FundSwift
//
//  Created by D on 2019/6/10.
//  Copyright © 2019 D. All rights reserved.
//

import UIKit

class Banner: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubView(){
        let frame = self.bounds
       // vs = UIScrollView (frame: CGRect(x: 0, y: 0, width: Screen_Width, height: Screen_Height))
    }
}
