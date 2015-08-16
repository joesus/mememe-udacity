//
//  TextFieldExamplesVC.swift
//  MememeUdacity
//
//  Created by Joe Susnick on 8/15/15.
//  Copyright (c) 2015 Joe Susnick Co. All rights reserved.
//

import UIKit

class TextFieldExamplesVC: UIViewController, UITextFieldDelegate {

    // Setup Outlets
    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockableTextField: UITextField!
    @IBOutlet weak var textFieldLock: UISwitch!
    
    // Setup Delegate Objects
    let zipCodeDelegate = ZipCodeDelegate()
    let cashTextDelegate = CashTextDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zipCodeField.delegate = zipCodeDelegate
        cashTextField.delegate = cashTextDelegate
        lockableTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if textFieldLock.on {
            return true
        } else {
            return false
        }
    }
    
}
