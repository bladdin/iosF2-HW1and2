//Ben Laddin
//IOS Foundations 2
//HW 1 Pokemon Database

import UIKit

class Pokemon{
  var hp = 100
  var level = 1
  var defence = 200
  var attack = 50
  
  init(startingLevel : Int, startingHp : Int, startingDefence : Int, startingAttack : Int){
    self.level = startingLevel
  }
  
  func damageByAttack(attack : Int, enemyHealth : Int, enemyDefence : Int, attackMultiplier : Int) -> Int{
    var defence = 0;
    var newHealth = 0;
    defence = enemyDefence * Int(1/4)
    newHealth = enemyHealth - ((attack*attackMultiplier)-defence)
    return newHealth
  }
}

class Scyther : Pokemon{
  var type = "Bug and Flying"
}

class Scizor : Scyther{
}

class Charmander : Pokemon{
  var type = "Fire"
}

class Charizard : Charmander{
}

class Dragonair : Pokemon{
  var type = "Dragon"
}

class Dragonite : Dragonair {
}

class Gastly : Pokemon{
  var type = "Ghost and Poison"
}

class Gengar : Gastly{
  
}

class Munchlax : Pokemon{
  var type = "Normal"
}

class Snorelax : Munchlax{
  
}
let mySnorelax = Snorelax(startingLevel: 1, startingHp: 250, startingDefence: 300, startingAttack: 120)



