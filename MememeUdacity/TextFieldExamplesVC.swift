//
//  TextFieldExamplesVC.swift
//  MememeUdacity
//
//  Created by Joe Susnick on 8/15/15.
//  Copyright (c) 2015 Joe Susnick Co. All rights reserved.
//

import UIKit

class TextFieldExamplesVC: UIViewController {

    // Setup Outlets
    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockableTextField: UITextField!
    
    // Setup Delegate Objects
    let zipCodeDelegate = ZipCodeDelegate()
    let cashTextDelegate = CashTextDelegate()
    let lockableTextDelegate = LockableTextDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zipCodeField.delegate = zipCodeDelegate
        cashTextField.delegate = cashTextDelegate
        lockableTextField.delegate = lockableTextDelegate
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
