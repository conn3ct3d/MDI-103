import UIKit

//
//  Assingment3.swift
//  Project103
//
//  Created by Emiliano on 10/4/25.
//

class Course {
    var courseName: String
    var students: [StudentClass]
    
    init(_ courseName: String) {
        self.courseName = courseName
        self.students = []
    }
    
    func enrollStudent(_ student: StudentClass) {
        students.append(student)
        print("\(student.name) has been enrolled in \(courseName).")
    }
    
    func listStudents() {
        print("Students in \(courseName):")
        for student in students {
            print("- \(student.name), Age: \(student.age)")
        }
    }
    
    func getCourseAverage() -> Double {
        if students.isEmpty {
            return 0.0
        }
        
        
        let total = students.reduce(0.0) { partial, student in
            partial + (student.grades.reduce(0,+) / Double(student.grades.count))
        }
        
        return total / Double(students.count)
    }
}

class StudentClass {
    var name: String
    var age: Int
    var grades: [Double]
    
    init(_ name: String, _ age: Int, _ grades: [Double]) {
        self.name = name
        self.age = age
        self.grades = grades
    }
    
    func getAverageGrade() -> String {
        if grades.isEmpty {
            return "0.0"
        }
        let average = grades.reduce(0,+)/Double(grades.count)
        if average > 60 {
            return "\(name) has a passing grade of \(average)"
        } else {
            return "\(name) has a failing grade of \(average)"
        }
    }
}

let student = StudentClass("Maria", 27, [100.0, 100.0, 94.0])
let student2 = StudentClass("Lucas", 26, [50.00, 75.00, 49.00])

let course1 = Course("MDI-103")
course1.enrollStudent(student)
course1.enrollStudent(student2)

course1.listStudents()
print("Course average: \(course1.getCourseAverage())")
