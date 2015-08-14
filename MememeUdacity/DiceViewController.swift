//
//  DiceViewController.swift
//  MememeUdacity
//
//  Created by A658308 on 8/14/15.
//  Copyright (c) 2015 Joe Susnick Co. All rights reserved.
//

import Foundation
import UIKit

class DiceViewController: UIViewController {

    var firstValue: Int?
    var secondValue: Int?
    
    @IBOutlet weak var firstDie: UIImageView!
    @IBOutlet weak var secondDie: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        if let firstValue = self.firstValue {
            self.firstDie.image = UIImage(named: "d\(firstValue)")
        } else {
            self.firstDie.image = nil
        }
        
        if let secondValue = self.secondValue {
            self.secondDie.image = UIImage(named: "d\(secondValue)")
        } else {
            self.secondDie.image = nil
        }
        
        firstDie.alpha = 0
        secondDie.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3) {
            self.firstDie.alpha = 1
            self.secondDie.alpha = 1
        }
    }
    
    @IBAction func dismiss(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
