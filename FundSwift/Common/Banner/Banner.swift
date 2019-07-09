//
//  Banner.swift
//  FundSwift
//
//  Created by D on 2019/6/10.
//  Copyright © 2019 D. All rights reserved.
//

import UIKit

class Banner: UIView,UIScrollViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var pc : UIPageControl!
    var sv : UIScrollView!
    var timer: Timer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sv = UIScrollView.init(frame: CGRect(x: 0, y: 0, width: Screen_Width, height: 300))
        sv.delegate = self
        sv.isPagingEnabled = true
        sv.showsVerticalScrollIndicator = false
        sv.showsHorizontalScrollIndicator = false
        sv.isScrollEnabled = true
        addSubview(sv)
        
        
        
        for i in 1...3 {
            let image = UIImage(named: "pic\(i).jpg")
            let _x = CGFloat(i-1) * Screen_Width
            
            var imageView = UIImageView.init(frame: CGRect(x: _x, y: 0, width: Screen_Width, height: 300))
            imageView.image = image
            
            sv.addSubview(imageView)
            
        }
        sv.contentSize = CGSize.init(width: Screen_Width * 3, height: sv.frame.height)
        pc = UIPageControl.init(frame: CGRect(x: Screen_Width/4-50/2, y: Screen_Height/4-40, width: 50, height: 40))
        addSubview(pc)
        pc.numberOfPages = 3
        pc.currentPageIndicatorTintColor = UIColor.red
        pc.pageIndicatorTintColor = UIColor.white
         addTimer()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let index = (offsetX + Screen_Width/2)/Screen_Width
        pc.currentPage = Int(index)
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
    
    func addTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector (nextImage), userInfo: nil, repeats: true)
    }
    
    func removeTimer() {
       timer.invalidate()
    }
    
    @objc func nextImage() {
        var pageIndex = pc.currentPage
        if pageIndex == 2 {
            pageIndex = 0
        }else {
            pageIndex+=1
        }
        let offsetX = CGFloat(pageIndex) * Screen_Width
        sv.setContentOffset(CGPoint.init(x: offsetX, y: 0), animated: true)
        
    }
}
