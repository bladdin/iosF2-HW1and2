//
//  DetailViewController.swift
//  Roster
//
//  Created by Benjamin Laddin on 6/11/15.
//  Copyright (c) 2015 Benjamin Laddin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var firstNameLabel: UILabel!
  @IBOutlet weak var lastNameLabel: UILabel!
 
  
  var selectedPerson : Person!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    firstNameLabel.text = selectedPerson.first
    lastNameLabel.text = selectedPerson.last
    // Do any additional setup after loading the view.
  }
}
