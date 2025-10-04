import UIKit

var arr1 = ["AAA", "AAB", "CAA", "KCA", "XOO", "PPO"]
 
func sortArrayAtoZ(_ array : [String]) -> [String]{
    // returns a new sorted array
    let sortedArray = array.sorted()
    return sortedArray
}

print(sortArrayAtoZ(arr1))



