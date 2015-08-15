//
//  CashTextDelegate.swift
//  MememeUdacity
//
//  Created by Joe Susnick on 8/15/15.
//  Copyright (c) 2015 Joe Susnick Co. All rights reserved.
//

import UIKit

class CashTextDelegate: NSObject, UITextFieldDelegate {
   
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
            var oldText = textField.text as NSString
            var newText = oldText.stringByReplacingCharactersInRange(range, withString: string)
            var newTextString = String(newText)
            
            let digits = NSCharacterSet.decimalDigitCharacterSet()
            var digitText = ""
            for c in newTextString.unicodeScalars {
                if digits.longCharacterIsMember(c.value) {
                    digitText.append(c)
                }
            }
        
        if let numberOfPennies = digitText.toInt() {
            newText = "$" + self.dollarStringFromInt(numberOfPennies) + "." + self.centsFromInt(numberOfPennies)
        } else {
            newText = "$0.00"
        }
        
        textField.text = newText

        return false
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text.isEmpty {
            textField.text = "$0.00"
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    func dollarStringFromInt(cents: Int) -> String {
        return "\(cents/100)"
    }
    
    func centsFromInt(cents: Int) -> String {
        let remainingCents = "\(cents % 100)"
        let numCents = count(remainingCents)
        if numCents < 2 {
            return "0\(remainingCents)"
        } else {
            return remainingCents
        }
    }
    
}
