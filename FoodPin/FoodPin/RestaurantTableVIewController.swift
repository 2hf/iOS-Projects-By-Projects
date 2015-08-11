//
//  RestaurantTableVIewController.swift
//  FoodPin
//
//  Created by Fan Zhang on 8/4/15.
//  Copyright (c) 2015 ZH.F. All rights reserved.
//

import UIKit

class RestaurantTableVIewController: UITableViewController {
    
    var restaurantNamesCN = ["仿膳饭庄","全聚德","东来顺","同和居","砂锅居","泰丰居","万福居","阳春居","东兴居","广和居","福兴居","丰泽园","鸿宾楼"]
    var restaurantNames = [
        "Cafe Deadend","Homei","Teakha","Cafe Loisl","Petite Oyster","ForKee Restaurant","Po's Atelier",
        "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif",
        "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional",
        "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"
    ]
    var restaurantImages = [
        "cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg",
        "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg",
        "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg",
        "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg",
        "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"
    ]
    var restaurantLocations = [
        "Hong Kong", "HongKong", "Hong Kong", "Hong Kong", "Hong Kong",
        "HongKong", "Hong Kong", "Sydney", "Sydney", "Sydney","New York", "New York",
        "New York", "New York", "NewYork", "New York", "New York", "London",
        "London","London", "London"
    ]
    var restaurantTypes = [
        "Coffee & Tea Shop","Cafe", "Tea House", "Austrian / Causual Drink",
        "French", "Bakery", "Bakery", "Chocolate", "Cafe","American / Seafood",
        "American", "American","Breakfast & Brunch", "Coffee & Tea","Coffee &Tea",
        "Latin American", "Spanish", "Spanish","Spanish", "British", "Thai"
    ]
    var restaurantIsVisited = [Bool](count: 21, repeatedValue: false)

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurantNames.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomTableViewCell

        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLable.text = restaurantLocations[indexPath.row]
        cell.typeLable.text = restaurantTypes[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width/2;
        cell.thumbnailImageView.clipsToBounds = true
        
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .Checkmark: .None
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler:nil)
        let callActionHandler = {(action:UIAlertAction!)-> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
            
        }
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: UIAlertActionStyle.Default, handler: callActionHandler)
        let isVisitedAction = UIAlertAction(title: "I've been there", style: .Default, handler: {
            (action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .Checkmark
            self.restaurantIsVisited[indexPath.row] = true
        })
        
        let visitedAction = UIAlertAction(title: "You've been there", style: .Default, handler: {
            (action: UIAlertAction!)-> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .None
            self.restaurantIsVisited[indexPath.row] = false
        })
        
        optionMenu.addAction(callAction)
        optionMenu.addAction(cancelAction)
        
        if restaurantIsVisited[indexPath.row] {
            optionMenu.addAction(visitedAction)
        }else {
            optionMenu.addAction(isVisitedAction)
        }
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)//fasle means highlight disappear immediately
    }
    
    //add delete button by override this func
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //using tableView(_:editActionsForRowAtIndexPath) will make code below lose effect
//        if editingStyle == .Delete {
//            self.restaurantImages.removeAtIndex(indexPath.row)
//            self.restaurantNames.removeAtIndex(indexPath.row)
//            self.restaurantTypes.removeAtIndex(indexPath.row)
//            self.restaurantLocations.removeAtIndex(indexPath.row)
//            self.restaurantIsVisited.removeAtIndex(indexPath.row)
//            
////            self.tableView.reloadData();
//            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//            
//        }
//        
//        println("Total item: \(self.restaurantNames.count)")
//        for name in restaurantNames {
//            println(name)
//        }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        var shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: { (action:UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle:.ActionSheet)
            let twitterAction = UIAlertAction(title: "Twitter", style: UIAlertActionStyle.Default, handler: nil)
            let facebookAction = UIAlertAction(title: "Facebook", style:UIAlertActionStyle.Default, handler: nil)
            let emailAction = UIAlertAction(title: "Email", style: UIAlertActionStyle.Default,handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel,handler: nil)
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(emailAction)
            shareMenu.addAction(cancelAction)
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
        })
        
        var deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler:{ (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            self.restaurantImages.removeAtIndex(indexPath.row)
            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantIsVisited.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        })
        shareAction.backgroundColor = UIColor(red: 255.0/255.0, green: 166.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 235.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        return [deleteAction, shareAction]
    }

}
    

