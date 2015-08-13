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
    @IBOutlet weak var redControl: UISlider!
    @IBOutlet weak var greenControl: UISlider!
    @IBOutlet weak var blueControl: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        changeColorComponent()
    }
    
    @IBAction func changeColorComponent() {
        
        let r: CGFloat = CGFloat(redControl.value)
        let g: CGFloat = CGFloat(greenControl.value)
        let b: CGFloat = CGFloat(blueControl.value)
        
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}

