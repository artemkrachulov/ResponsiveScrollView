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
    
    // Load xib to the view
//    scrollViewContent = (NSBundle.mainBundle().loadNibNamed("View", owner: self, options: nil).first) as! UIView
		
		scrollViewContent = UIView.instanceFromNib("View", owner: self, bundle: nil)

//		scrollViewContent = UIScrollView()
		
//		 scrollViewContent.loadFromNib("View", bundle: NSBundle.mainBundle(), id: 0)
		
//		view.loadFromNib(nil, bundle: NSBundle.mainBundle())
		
		
/* view.loadFromNib(nil, bundle: NSBundle.mainBundle()) */
		
//		scrollViewContent = UIView.instanceFromNib()
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
    
    // 1. Set new size to content View
    scrollViewContent.frame.size = scrollView.frame.size
    
    // 2. Layout subviews to get container height
    scrollViewContent.layoutSubviews()
    
    // 3. Set Scroll view content size
    scrollView.contentSize = scrollViewContentInner.frame.size
    
    // 4. Update content View height
     scrollViewContent.frame.size.height = scrollViewContentInner.frame.size.height
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    // Update content View height totally
    scrollViewContent.frame.size.height = scrollViewContentInner.frame.size.height
  }
}