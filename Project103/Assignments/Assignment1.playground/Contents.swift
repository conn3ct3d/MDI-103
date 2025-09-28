import UIKit

let studentNames:[String] = ["Richard", "Nar", "Ramses", "Emiliano", "Daniel"];
let studentGrades:[String: [Double]] = [
    "Richard":[80.0, 90.0, 85.0],
    "Nar":[80.0, 90.0, 85.0],
    "Ramses":[80.0, 90.0, 85.0],
    "Emiliano":[80.0, 90.0, 85.0],
    "Daniel":[80.0, 90.0, 85.0]
];

func calculateAverage(grades: [Double]) -> Double  {
    var total:Double = 0
    for grade in grades{
        total += grade
    }
    return total / Double(grades.count)
}

print("Students record summary: \n");
for studentName in studentNames{
    print("Student: \(studentName)");
    print("Grades: \(studentGrades[studentName]!) \n")
    print("Avg:  \(calculateAverage(grades: studentGrades[studentName])!) \n");
}

