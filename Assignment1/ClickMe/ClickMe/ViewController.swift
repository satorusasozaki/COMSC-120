//
//  ViewController.swift
//  ClickMe
//
//  Created by Satoru Sasozaki on 2/15/16.
//  Copyright © 2016 Satoru Sasozaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.yellowColor()
        
        let button = UIButton(type: UIButtonType.System) as UIButton
        button.frame = CGRectMake(130, 100, 100, 50)
        button.backgroundColor = UIColor.greenColor()
        button.setTitle("Click Me", forState: UIControlState.Normal)
        button.addTarget(self, action: "showAlertMessage:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    func showAlertMessage(sender:UIButton!) {
        let alertController = UIAlertController(title: "I'm clicked", message: "Hello San Ramon!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Thanks", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    
    
}
