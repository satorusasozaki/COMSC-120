//
//  CafeTableViewController.swift
//  cafePin
//
//  Created by Satoru Sasozaki on 3/27/16.
//  Copyright © 2016 Satoru Sasozaki. All rights reserved.
//

import UIKit

class CafeTableViewController: UITableViewController {
    var cafeNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    var cafeImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    var cafeLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    var cafeTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var cafeIsVisited = [Bool](count: 21, repeatedValue: false)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Cafe Pin"
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cafeNames.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomTableViewCell
        cell.nameLabel?.text = cafeNames[indexPath.row]
        cell.thumbnailImageView?.image = UIImage(named: cafeImages[indexPath.row])
        
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        cell.LocationLabel.text = cafeLocations[indexPath.row]
        cell.typeLabel.text = cafeTypes[indexPath.row]
        cell.favoriteImageView.hidden = !self.cafeIsVisited[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "Now what?", preferredStyle: .ActionSheet)
        let isVisitedTitle = cafeIsVisited[indexPath.row] ? "Not been here" : "Been here"
        let isVisitedAction = UIAlertAction(title: isVisitedTitle, style: .Default, handler: {(action: UIAlertAction!)->Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! CustomTableViewCell
            self.cafeIsVisited[indexPath.row] = self.cafeIsVisited[indexPath.row] ? false : true
            cell.favoriteImageView.hidden = !self.cafeIsVisited[indexPath.row]
        })
        optionMenu.addAction(isVisitedAction)
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        self.presentViewController(optionMenu, animated: true, completion: nil)
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        var shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: {(action:UITableViewRowAction!,indexPath:NSIndexPath!)->Void in
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .ActionSheet)
            let facebookAction = UIAlertAction(title: "facebook", style: UIAlertActionStyle.Default, handler: nil)
            let twitterAction = UIAlertAction(title: "twitter", style: UIAlertActionStyle.Default, handler: nil)
            let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(cancelAction)
            self.presentViewController(shareMenu, animated: true, completion: nil)
        }
        )
        
        var deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: {(action:UITableViewRowAction!,indexPath:NSIndexPath!)->Void in
            self.cafeNames.removeAtIndex(indexPath.row)
            self.cafeLocations.removeAtIndex(indexPath.row)
            self.cafeTypes.removeAtIndex(indexPath.row)
            self.cafeIsVisited.removeAtIndex(indexPath.row)
            self.cafeImages.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
        )

        
        deleteAction.backgroundColor = UIColor.greenColor()
        
        return [deleteAction,shareAction]
    }
    
    
}
