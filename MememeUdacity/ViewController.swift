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
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func incrementCount(sender: UIButton) {
        sender.tag = 1
        modifyCount(sender)
    }
    
    @IBAction func decrementCounter(sender: UIButton) {
        sender.tag = -1
        modifyCount(sender)
    }
    
    func modifyCount(sender: UIButton) {
        println(sender)
        count += sender.tag
        label.text = "\(count)"
    }

}

