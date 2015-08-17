//
//  DetailViewController.swift
//  FoodPin
//
//  Created by Fan Zhang on 8/16/15.
//  Copyright (c) 2015 ZH.F. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var restaurantImageView:UIImageView!
    @IBOutlet var restaurantNameView:UILabel!
    @IBOutlet var restaurantLocationView:UILabel!
    @IBOutlet var restaurantTypeView:UILabel!
    
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.restaurantImageView.image = UIImage(named: restaurant.image)
        self.restaurantNameView.text = restaurant.name
        self.restaurantLocationView.text = restaurant.location
        self.restaurantTypeView.text = restaurant.type
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
