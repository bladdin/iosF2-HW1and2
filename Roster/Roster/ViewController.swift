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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
    
    let ben = Person(firstName: "Ben", lastName: "Laddin")
    let jon = Person(firstName: "Jon", lastName: "Snow")
    let ricky = Person(firstName: "Ricky", lastName: "Bobby")
    let eric = Person(firstName: "Eric", lastName: "Clapton")
    let han = Person(firstName: "Han", lastName: "Solo")
    let indiana = Person(firstName: "Indiana", lastName: "Jones")
    let james = Person(firstName: "James", lastName: "Bond")
    self.namesOfPeople.append(ben)
    self.namesOfPeople.append(jon)
    self.namesOfPeople.append(ricky)
    self.namesOfPeople.append(eric)
    self.namesOfPeople.append(han)
    self.namesOfPeople.append(indiana)
    self.namesOfPeople.append(james)
    
  }
  

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.namesOfPeople.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    let displayPerson = self.namesOfPeople[indexPath.row]
    cell.textLabel?.text = displayPerson.first + " " + displayPerson.last
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController"{
      
      let detailViewController = segue.destinationViewController as! DetailViewController
      let indexPath = self.tableView.indexPathForSelectedRow()
      let selectedRow = indexPath!.row
      let selectedPerson = self.namesOfPeople[selectedRow]
      detailViewController.selectedPerson = selectedPerson
    }
  }
}
