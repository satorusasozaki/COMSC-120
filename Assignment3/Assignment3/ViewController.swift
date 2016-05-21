//
//  ViewController.swift
//  Assignment3
//
//  Created by Satoru Sasozaki on 3/7/16.
//  Copyright © 2016 Satoru Sasozaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var myStuff = ["apple","grape","melon","banana","orange","lemon","mango","strawberry","peach","coconut","avocado","blackberry","blueberry","cherry","durian","guava","kiwi","lime","passionfruit","persimmon","Raspberry","dragonfruit","pear","satsuma"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myStuff.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = myStuff[indexPath.row]
        cell.imageView?.image = UIImage(named: "apple")
        return cell
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

