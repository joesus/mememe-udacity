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
    var decrementButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Programmatically create label with text
        label = UILabel()
        label.frame = CGRectMake(150, 150, 60, 60)
        label.text = "0"
        
        // Programatically create button
        incrementButton = UIButton()
        incrementButton.tag = 1
        incrementButton.frame = CGRectMake(150, 250, 100, 60)
        incrementButton.setTitle("Increment", forState: .Normal)
        incrementButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        incrementButton.addTarget(self, action: "modifyCount:", forControlEvents: UIControlEvents.TouchUpInside)
        
        decrementButton = UIButton()
        decrementButton.tag = -1
        decrementButton.frame = CGRectMake(150, 350, 100, 60)
        decrementButton.setTitle("Decrement", forState: .Normal)
        decrementButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        decrementButton.addTarget(self, action: "modifyCount:", forControlEvents: UIControlEvents.TouchUpInside)
        
        // Add buttons to main view
        self.view.addSubview(label)
        self.view.addSubview(incrementButton)
        self.view.addSubview(decrementButton)
    }
    
    func modifyCount(sender: UIButton) {
        println(sender)
        count += sender.tag
        label.text = "\(count)"
    }

}

