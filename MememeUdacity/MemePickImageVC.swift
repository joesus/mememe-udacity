//
//  MemePickImageVC.swift
//  MememeUdacity
//
//  Created by Joe Susnick on 8/16/15.
//  Copyright (c) 2015 Joe Susnick Co. All rights reserved.
//

import UIKit

class MemePickImageVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {

    let memeTextAttributes = [
        NSStrokeColorAttributeName : UIColor.blackColor(),
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName : -1.0,
    ]
    
    var imagePickerController: UIImagePickerController!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var memeContainerView: UIView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var scrollImageView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Disable the camera button if on a sim
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            cameraButton.enabled = true
        } else {
            cameraButton.enabled = false
        }
        
        // Initialize the shared imagePickerController and set the delegate to self
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        // Set textfield delegates to self
        topTextField.delegate = self
        bottomTextField.delegate = self
        
        // Set default textfield attributes
        topTextField.defaultTextAttributes = memeTextAttributes
        topTextField.attributedPlaceholder = NSAttributedString(string:topTextField.placeholder!, attributes: memeTextAttributes)
        topTextField.textAlignment = .Center
        
        bottomTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.attributedPlaceholder = NSAttributedString(string:bottomTextField.placeholder!, attributes: memeTextAttributes)
        bottomTextField.textAlignment = .Center
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.subscribeToKeyboardNotifications()
        self.subscribeToOrientationNotifications()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.unsubscribeFromKeyboardNotifications()
    }
    
    // MARK: - Notifications
    
    func subscribeToOrientationNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateTextFieldConstraints:", name: UIDeviceOrientationDidChangeNotification, object: nil)
    }
    
    func subscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        // TODO: Figure out how to make this conditional on the box being clicked
        if bottomTextField.isFirstResponder() {
            self.view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if bottomTextField.isFirstResponder() {
            self.view.frame.origin.y += getKeyboardHeight(notification)/2
        }
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        var info = notification.userInfo as Dictionary!
        let rect = info[UIKeyboardFrameBeginUserInfoKey] as! NSValue
        return rect.CGRectValue().size.height
    }
    
    // MARK: - Image picking methods

    @IBAction func pickImageFromAlbum(sender: UIBarButtonItem) {
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func pickImageFromCamera(sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            println("camera available")
            imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
        }
        
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        // sets the scrollview to the image size
        scrollView.contentSize = image.size
        scrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        
        imageView.image = image

        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - TextField Delegate Methods
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Mark: - Meme Creation and Sharing Methods
    
    @IBAction func Share(sender: UIBarButtonItem) {
        
        // new activity vc
        let activityVC = UIActivityViewController(activityItems: [generateMemedImage()], applicationActivities: nil)
        presentViewController(activityVC, animated: true, completion: nil)
    }
    
    func generateMemedImage() -> UIImage {
        
        UIGraphicsBeginImageContext(scrollImageView.bounds.size)
        scrollImageView.layer.renderInContext(UIGraphicsGetCurrentContext())
        let memedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // SAVE TO APPLICTION CONTROLLER
        let meme = Meme(topText: topTextField.text, bottomText: bottomTextField.text, image: memedImage)
        
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
        
        return memedImage
    }
    
    func updateTextFieldConstraints(notification: NSNotification) {
        self.view.updateConstraintsIfNeeded()
    }
}
