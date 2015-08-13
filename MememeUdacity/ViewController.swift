//
//  ViewController.swift
//  MememeUdacity
//
//  Created by A658308 on 8/13/15.
//  Copyright (c) 2015 Joe Susnick Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    var label:UILabel!
    var incrementButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Programmatically create label with text
        label = UILabel()
        label.frame = CGRectMake(150, 150, 60, 60)
        label.text = "0"
        
        // Programatically create button
        incrementButton = UIButton()
        incrementButton.frame = CGRectMake(150, 250, 100, 60)
        incrementButton.setTitle("Increment", forState: .Normal)
        incrementButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        incrementButton.addTarget(self, action: "incrementCount", forControlEvents: UIControlEvents.TouchUpInside)
        
        // Add buttons to main view
        self.view.addSubview(label)
        self.view.addSubview(incrementButton)
    }
    
    func incrementCount() {
        count++
        label.text = "\(count)"
    }

}

