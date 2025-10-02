import UIKit

var fruits:[String] = ["Banana", "Apple", "Orange"]
print("First value is: ", fruits[0])
for fruit in fruits {
    print(fruit)
}

for (index, fruit) in fruits.enumerated(){
    print("\n the \(index) fruit is: \(fruit)")
}

fruits.append("Mango")
print(fruits)

fruits.append(contentsOf:["Grapes", "Pinapple", "Cherry"])
print(fruits)
