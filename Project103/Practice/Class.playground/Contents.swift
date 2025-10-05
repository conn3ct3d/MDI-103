import UIKit

class Pet:CustomStringConvertible {
    // Attributes (data, variables, constants)
    var name:String
    var age:Int
    var owner:String
    
    // Methods (behavior)
    init(_ name : String, _ age :Int, _ owner :String) {
        self.name = name
        self.age = age
        self.owner = owner
    }
    
    var description:String {
        return "Name \(name), Age: \(age), Owner: \(owner)"
    }
}

let firstPet = Pet("Bacon", 4, "Jake")

// print("The name of the first pet is \(firstPet.name) and he is \(firstPet.age)")
print(firstPet)
