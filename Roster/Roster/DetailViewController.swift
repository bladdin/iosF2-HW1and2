//
//  DetailViewController.swift
//  Roster
//
//  Created by Benjamin Laddin on 6/11/15.
//  Copyright (c) 2015 Benjamin Laddin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  
  var selectedPerson : Person!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupTextFields()
  }
  
  private func setupTextFields(){
    
    self.firstNameTextField.delegate = self
    self.lastNameTextField.delegate = self
    self.firstNameTextField.tag = 0
    self.lastNameTextField.tag = 1
    self.firstNameTextField.text = self.selectedPerson.first
    self.lastNameTextField.text = self.selectedPerson.last
    
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    if textField.tag == 0 {
      self.selectedPerson.first =  textField.text
    }
    else {
      self.selectedPerson.last = textField.text
    }
  }
  
  @IBAction func photoButtonPressed(sender: AnyObject) {
    
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    imagePickerController.allowsEditing = true
    
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
      self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    
    let image = info[UIImagePickerControllerEditedImage] as! UIImage
    self.imageView.image = image
    self.selectedPerson.image = image
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
}
