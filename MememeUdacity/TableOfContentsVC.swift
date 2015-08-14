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
        self.presentViewController(UIImagePickerController(), animated: true, completion: nil)
    }
}
