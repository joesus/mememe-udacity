//
//  ZipCodeDelegate.swift
//  MememeUdacity
//
//  Created by Joe Susnick on 8/15/15.
//  Copyright (c) 2015 Joe Susnick Co. All rights reserved.
//

import UIKit

class ZipCodeDelegate: NSObject, UITextFieldDelegate {
   
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // Count the length of the text currently in the textfield add the length of the proposed string
        let newLength = count(textField.text) + count(string)
        // Resign the keyboard if the length is 5
        
        if newLength < 6 {
            return true
        } else {
            textField.resignFirstResponder()
            return false
        }
    }
}
