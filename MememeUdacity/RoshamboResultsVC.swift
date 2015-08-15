//
//  RoshamboResultsVC.swift
//  MememeUdacity
//
//  Created by A658308 on 8/14/15.
//  Copyright (c) 2015 Joe Susnick Co. All rights reserved.
//

import Foundation
import UIKit

class RoshamboResultsVC: UIViewController {

    var gameState: RoshamboResult!
    @IBOutlet weak var resultImage: UIImageView!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        setResultImage(gameState)
    }
    
    func setResultImage(result: RoshamboResult) {
        switch result {
        case .ScissorsBeatsPaper:
            resultImage.image = UIImage(named: "ScissorsCutPaper")
        case .PaperBeatsRock:
            resultImage.image = UIImage(named: "PaperCoversRock")
        case .RockBeatsScissors:
            resultImage.image = UIImage(named: "RockCrushesScissors")
        case .Tie:
            resultImage.image = UIImage(named: "itsATie")
        }
    }
    
    @IBAction func goBack(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
