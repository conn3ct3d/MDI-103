import UIKit

//
//  Assingment3.swift
//  Project103
//
//  Created by Emiliano on 10/4/25.
//

class StudentClass{
    var name:String
    var age:Int
    var grades:[Double]
    
    init(_ name:String, _ age:Int, _ grades:[Double]){
        self.name = name
        self.age = age
        self.grades = grades
    }
    
    func getAverageGrade() -> String {
        if grades.isEmpty{
            return "0.0"
        }
        let average = grades.reduce(0,+)/Double(grades.count)
        if average > 60 {
            return "\(name) has a passing grade of \(average)"
        }
        else {
            return "\(name) has a failing grade of \(average)"
        }
    }
}

let student = StudentClass("Maria", 27, [100.0, 100.0, 94.0])
let student2 = StudentClass("Lucas", 26, [50.00, 75.00, 49.00])

print()
print(student.getAverageGrade())
print()
print(student2.getAverageGrade())
