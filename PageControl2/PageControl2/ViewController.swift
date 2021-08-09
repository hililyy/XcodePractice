//
//  ViewController.swift
//  PageControl2
//
//  Created by 강조은 on 2021/08/08.
//

import UIKit
let NUM_PAGE = 10

class ViewController: UIViewController {

    @IBOutlet var lblView: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = NUM_PAGE
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        
        lblView.text = String(pageControl.currentPage+1)
        
        
        
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        lblView.text = String(pageControl.currentPage+1)
    }
}
