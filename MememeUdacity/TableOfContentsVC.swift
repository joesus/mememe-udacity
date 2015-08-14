//
//  TableOfContentsVC.swift
//  MememeUdacity
//
//  Created by A658308 on 8/14/15.
//  Copyright (c) 2015 Joe Susnick Co. All rights reserved.
//

import UIKit

class TableOfContentsVC: UIViewController {

    @IBAction func experiment(sender: UIButton) {
        let image = UIImage()
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.presentViewController(controller, animated: true, completion: nil)
    }

    /**
    * Randomly generates a Int from 1 to 6
    */
    func randomDiceValue() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 6
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    
    @IBAction func rollTheDice(sender: UIButton) {
        performSegueWithIdentifier("rollDice", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var controller: DiceViewController
        
        controller = segue.destinationViewController as! DiceViewController
        controller.firstValue = self.randomDiceValue()
        controller.secondValue = self.randomDiceValue()
    }
    
    
}
