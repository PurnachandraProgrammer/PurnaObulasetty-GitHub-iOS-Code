import UIKit

// Value types - Structs, Enums and tuples
// Reference types - classes,actors and closures


// Classes and structures
// Common properties between classes and structures

/*
1. Has stored, computable and lazy properties
2. Can conform to protocols.
3. Subscriptions are available
4. can extend the classes by using generics
5. has initializers
*/


// Particular classes has
/*
1. Inherticance allowed in classes and not in other types
2. Has de-initializers
3. Classes come with the built-in notion of identity, because they’re reference types. With the identity operator === you can check if two references (variables, constants, properties, etc.) refer to the same object.
*/

struct User {
    
    // struct by default, system will create initializers
    // Copnveince initializers are not avaialble in strcutres.
    var name:String
    var address:String
    var age:Int
    
    init(name:String,address:String,age:Int) {
        self.name = name
        self.address = address
        self.age = age
    }
    
    init(name:String) {
        self.init(name: name, address: "Address not available", age: 22)
    }
}




// Classes
class Vehicle {
    
    let numberOfTyres:Int
    let vehicleName:String
    
    // For classes, we need to create initializers
    init(numberOfTyres: Int, vehicleName: String) {
        self.numberOfTyres = numberOfTyres
        self.vehicleName = vehicleName
    }
    
    convenience init(vehicleName:String) {
        self.init(numberOfTyres: 0, vehicleName: vehicleName)
    }
    
    public var description:String {
        let str = "The numberOfTyres is \(numberOfTyres) vehicle name is \(vehicleName)"
        return str
    }
    
    deinit {
        
    }
    
}


class Car : Vehicle {
    // add properties and functions related to car
}
class Bike : Vehicle {
    // add properties and functions related to Bike
}


// structures - pass by value.
let testStrucutreObject = User(name: "Purna user", address: "Purna Bangalore", age: 35)
var secondObject = testStrucutreObject
secondObject.name = "new purna"

print("The testStrucutreObject is \(testStrucutreObject)")
print("The secondObject is \(secondObject)")

// classes - pass by reference
let classObject = Vehicle(numberOfTyres: 4, vehicleName: "Skoda")
print("The class object is \(classObject)")
let secondClassObject = classObject
print("The second class object is \(secondClassObject)")

if classObject === secondClassObject {
    print("The class objects are equal")
}
else {
    print("The class objects are not equal ")
}
