//
//  ViewController.swift
//  ResponsiveScrollView
//
//  Created by Krachulov Artem  on 9/27/15.
//  Copyright © 2015 Artem Krachulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Outlets
  //         _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
  
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet var scrollViewContent: UIView!
  @IBOutlet weak var scrollViewContentInner: UIView!
  
  // MARK: - Life Cycle
  //         _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    // Embed Details View to Scroll View
    scrollViewContent = (NSBundle.mainBundle().loadNibNamed("View", owner: self, options: nil).first) as! UIView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    scrollView.addSubview(scrollViewContent)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    // Get Height
    scrollViewContent.frame.size = scrollView.frame.size
    scrollViewContent.layoutSubviews()
    
    // Update
    scrollView.contentSize =  scrollViewContentInner.frame.size
    scrollViewContent.subviews.first?.frame.size.height = scrollViewContentInner.frame.size.height
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    // Update
    scrollViewContent.frame.size.height = scrollViewContentInner.frame.size.height
  }
}