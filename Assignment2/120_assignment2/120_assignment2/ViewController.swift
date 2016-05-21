//
//  ViewController.swift
//  120_assignment2
//
//  Created by Satoru Sasozaki on 2/24/16.
//  Copyright © 2016 Satoru Sasozaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myName: UITextField!
    @IBOutlet weak var myAmount: UITextField!
    @IBOutlet weak var myFamily: UITextField!
    @IBOutlet weak var myTemplate: UITextView!
    @IBOutlet weak var myLetter: UITextView!
    @IBAction func generateLetter(sender: AnyObject) {
        self.myLetter.text = self.myTemplate.text.stringByReplacingOccurrencesOfString("<name>", withString: myName.text!)
        self.myLetter.text = self.myLetter.text.stringByReplacingOccurrencesOfString("<amount>", withString: myAmount.text!)
        self.myLetter.text = self.myLetter.text.stringByReplacingOccurrencesOfString("<family>", withString: myFamily.text!)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

