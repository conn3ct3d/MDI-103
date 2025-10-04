import UIKit

let studentGrades:[String: [Double]] = [
    "Richard": [80.0, 90.0, 85.0],
    "Nar": [80.0, 90.0, 85.0],
    "Ramses": [80.0, 90.0, 85.0],
    "Emiliano": [80.0, 90.0, 85.0],
    "Daniel": [80.0, 90.0, 85.0],
    "Maria":[100.0,100.0,100.0]
]

func calculateAverage(grades: [Double]) -> Double {
    let total = grades.reduce(0, +) // adds (+) all the elements of `grades` starting from position [0]
    return total / Double(grades.count) // divides total among the number of elements in grades
    
}

var highestAverage = 0.0
var highestAverageName = ""

print("Students record summary: \n")

for (name, grades) in studentGrades {
    
    var currentStudentAverage = calculateAverage(grades:grades)
    if currentStudentAverage > highestAverage{
        highestAverage = currentStudentAverage
        highestAverageName = name
    }
    print("Student: \(name)")
    print("Grades: \(grades)")
    print("Avg: \(currentStudentAverage) \n")
}
print("The highest average belonged to \(highestAverageName), with an average of \(highestAverage)")

