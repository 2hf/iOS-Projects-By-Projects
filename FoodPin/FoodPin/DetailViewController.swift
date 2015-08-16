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
    
    var restaurantImage:String!
    var restaurantName:String!
    var restaurantLocation:String!
    var restaurantType:String!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.restaurantImageView.image = UIImage(named: restaurantImage)
        self.restaurantNameView.text = restaurantName
        self.restaurantLocationView.text = restaurantLocation
        self.restaurantTypeView.text = restaurantType
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
