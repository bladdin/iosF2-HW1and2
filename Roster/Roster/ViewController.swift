//
//  ViewController.swift
//  Roster
//
//  Created by Benjamin Laddin on 6/11/15.
//  Copyright (c) 2015 Benjamin Laddin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  var namesOfPeople = [Person]()
  var info = [String : Person]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let peopleFromArchive = self.loadFromArchive() {
      self.namesOfPeople = peopleFromArchive
    } else {
      self.peopleInPlist()
      self.saveToArchive()
    }
    self.tableView.dataSource = self
    
  }
  
    

  
  private func peopleInPlist() {
    if let peoplePath = NSBundle.mainBundle().pathForResource("People", ofType: "plist"),
      peopleObjects = NSArray(contentsOfFile: peoplePath) as? [[String : String]]
    {
      for object in peopleObjects {
        
        if let first = object["FirstName"], last = object["LastName"] {
            let person = Person(firstName: first, lastName: last)
            self.namesOfPeople.append(person)
        }
      }
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.reloadData()
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.namesOfPeople.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PersonCell
    cell.backgroundColor = UIColor.whiteColor()
    cell.personImageView.layer.cornerRadius = 15
    cell.personImageView.layer.masksToBounds = true;
    cell.personImageView.layer.borderWidth = 10
    cell.personImageView.layer.borderColor = UIColor.redColor().CGColor
    let personToDisplay = self.namesOfPeople[indexPath.row]
    if let image = personToDisplay.image {
      cell.personImageView.image = image
    }
    
    cell.firstNameLabel.text = personToDisplay.first
    cell.lastNameLabel.text = personToDisplay.last
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    if let lastSelectedName = userDefaults.objectForKey("LastSelected") as? String where lastSelectedName == personToDisplay.first  {
      
      cell.backgroundColor = UIColor.lightGrayColor()
    }
    
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController"{
      
      if segue.identifier == "ShowDetailViewController" {
        
        if let detailViewController = segue.destinationViewController as? DetailViewController {
          
          let myIndexPath = self.tableView.indexPathForSelectedRow()
          
          if let indexPath = self.tableView.indexPathForSelectedRow() {
            
            let selectedRow = indexPath.row
            let selectedPerson = self.namesOfPeople[selectedRow]
            println(selectedPerson.first)
            detailViewController.selectedPerson = selectedPerson
            
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setObject(selectedPerson.first, forKey: "LastSelected")
            userDefaults.synchronize()
            
            
            // detailViewController.setupTextFields()
          }
          
        }
      }
    }
  }
  func saveToArchive() {
    
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String {
      println(archivePath)
      NSKeyedArchiver.archiveRootObject(self.namesOfPeople, toFile: archivePath + "/archive")
    }
  }
  
  func loadFromArchive() -> [Person]? {
    
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String {
      
      if let peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath + "/archive") as? [Person] {
        return peopleFromArchive
      }
      
    }
    return nil
    
  }

}
