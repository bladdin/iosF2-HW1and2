//
//  Person.swift
//  Roster
//
//  Created by Benjamin Laddin on 6/14/15.
//  Copyright (c) 2015 Benjamin Laddin. All rights reserved.
//

import UIKit

class Person : NSObject, NSCoding {
  
  var first : String
  var last : String
  var image : UIImage?
  
  
  
  init(firstName : String, lastName : String){
    self.first = firstName
    self.last = lastName
  }
  required init(coder aDecoder: NSCoder) {
    self.first = aDecoder.decodeObjectForKey("firstName") as!String
    self.last = aDecoder.decodeObjectForKey("lastName") as! String
    self.image = aDecoder.decodeObjectForKey("image") as? UIImage
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.first, forKey: "firstName")
    aCoder.encodeObject(self.last, forKey: "lastName")
    aCoder.encodeObject(self.image, forKey: "image")
  }

}
