//
//  RoshamboVC.swift
//  MememeUdacity
//
//  Created by A658308 on 8/14/15.
//  Copyright (c) 2015 Joe Susnick Co. All rights reserved.
//

import Foundation
import UIKit

enum RoshamboResult {
    case RockBeatsScissors, PaperBeatsRock, ScissorsBeatsPaper,  Tie
}

class RoshamboVC: UIViewController {

    var userChoice: RoshamboChoice!
    var gameState: RoshamboResult!
    
    enum RoshamboChoice: UInt32 {
        case Rock
        case Paper
        case Scissors
        
        static func random() -> RoshamboChoice {
            var maxValue: UInt32 = 0
            while let _ = self(rawValue: ++maxValue) {}
            
            let rand = arc4random_uniform(maxValue)
            return self(rawValue: rand)!
        }
    }
    
    @IBAction func shoot(sender: UIButton) {
        let userChoice = RoshamboChoice(rawValue: UInt32(sender.tag))!
        gameState = decideWinner(userChoice, computerChoice: RoshamboChoice.random())
        
        switch userChoice {
        case .Rock:
            let controller = self.storyboard!.instantiateViewControllerWithIdentifier("roshamboResultsVC") as! RoshamboResultsVC
            controller.gameState = gameState
            presentViewController(controller, animated: true, completion: nil)
        case .Scissors:
            performSegueWithIdentifier("showResults", sender: sender)
        case .Paper:
            println("do something")
        }
    }
    
    func decideWinner(userChoice: RoshamboChoice, computerChoice: RoshamboChoice) -> RoshamboResult {
        switch userChoice {
        case .Rock:
            if (computerChoice == .Scissors) {
                return .RockBeatsScissors
            } else if (computerChoice == .Paper) {
                return .PaperBeatsRock
            } else {
                return .Tie
            }
        case .Paper:
            if (computerChoice == .Scissors) {
                return .ScissorsBeatsPaper
            } else if (computerChoice == .Paper) {
                return .Tie
            } else {
                return .PaperBeatsRock
            }
        case .Scissors:
            if (computerChoice == .Scissors) {
                return .Tie
            } else if (computerChoice == .Paper) {
                return .ScissorsBeatsPaper
            } else {
                return .RockBeatsScissors
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)

        let controller = segue.destinationViewController as! RoshamboResultsVC
        controller.gameState = gameState
    }
    
}















