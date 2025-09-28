import UIKit
// collections
let arr:[String] = ["Richard", "Ramses", "Nar", "Emiliano"];
let arr2:[Int] = [1,1,1,1,1,1,1,1]

// sets
var gradeSet:Set<Int> = [10,20,30, 30];

var person:[String:Int] = ["Richard":22, "Ramses":30, "Nar":23];

print("Array of strings: ") //Allowes duplicates, keeps the order
print(arr)
print()
print("SET of ints: ") // doesn't allow duplicates, doesn't keep the order
print(gradeSet)
print()
print("Dictionary of String:Int ") // relation between K:V pairs
print("person")
print()
print()
print()


// Create array integers 1 to 5
// Remove the number 3
// Check if the number 4 is still in the array
var integers = [1,2,3,4,5]
let checkFor:Int = 4
integers.remove(at:2)
if integers.contains(checkFor){
    print("It does contain \(checkFor)")
} else {
    print("It does not contain \(checkFor)")
}

print()

// Create dictionary of 3 countries and their capitals, then show only values
var countries:[String:String] = ["Russia":"Moscow", "Argentina":"Buenos Aires", "South Africa":"Cape Town"]

countries["Japan"] = "Tokyo"

for (_, capital) in countries {
    print(capital)
}

//•Create a set of colors.
//•Add a new color.
//•Remove one color.
//Check if a specific color exists

print()

var colors: Set<String> = ["White", "Orange", "Red", "Green", "Blue"]
colors.insert("Purple")
var checkForColor = "Green"
colors.remove("Orange")
if colors.contains(checkForColor){
    print("We have that color")
} else {
    print("We don't have that color")
}
