//
//  MemePickImageVC.swift
//  MememeUdacity
//
//  Created by Joe Susnick on 8/16/15.
//  Copyright (c) 2015 Joe Susnick Co. All rights reserved.
//

import UIKit

class MemePickImageVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imagePickerController: UIImagePickerController!
    @IBOutlet weak var imagePickerView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func pickImage(sender: UIBarButtonItem) {
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imagePickerView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
