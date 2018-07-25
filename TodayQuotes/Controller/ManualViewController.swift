//
//  ManualViewController.swift
//  TodayQuotes
//
//  Created by Hyowon Choi on 2018. 7. 13..
//  Copyright © 2018년 Hyowonee. All rights reserved.
//

import UIKit

class ManualViewController: UIViewController {

    @IBOutlet var manualScrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for page in 0..<3 {
            let manualView = UIImageView()
            manualView.frame.origin.x = UIScreen.main.bounds.width * CGFloat(page)
            manualScrollView.addSubview(manualView)
        }
        
        self.manualScrollView.isPagingEnabled = true
        self.manualScrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 3, height: self.manualScrollView.frame.size.height)
        self.manualScrollView.alwaysBounceVertical = false
        
        self.pageControl.numberOfPages = 3
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }

}

extension ManualViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor(manualScrollView.contentOffset.x / UIScreen.main.bounds.width))
    }
}
