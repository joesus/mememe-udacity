//
//  ViewController.swift
//  MememeUdacity
//
//  Created by A658308 on 8/13/15.
//  Copyright (c) 2015 Joe Susnick Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redControl: UISwitch!
    @IBOutlet weak var greenControl: UISwitch!
    @IBOutlet weak var blueControl: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        changeColorComponent()
    }
    
    @IBAction func changeColorComponent() {
        
        let r: CGFloat = self.redControl.on ? 1 : 0
        let g: CGFloat = self.greenControl.on ? 1 : 0
        let b: CGFloat = self.blueControl.on ? 1 : 0
        
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    
//    @IBAction func changeColorComponent() {
//        
//        // Make sure the program doesn't crash if the controls aren't connected
//        if self.redControl == nil {
//            return
//        }
//        
//        let r: CGFloat = self.redControl.on ? 1 : 0
//        let g: CGFloat = self.greenControl.on ? 1 : 0
//        let b: CGFloat = self.blueControl.on ? 1 : 0
//        
//        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
//    }

}

