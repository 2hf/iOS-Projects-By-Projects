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
        return cell
    }
    

    
}
