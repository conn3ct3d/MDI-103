//
//  StudentListView.swift
//  Project103
//
//  Created by mbair on 10/4/25.
//

import SwiftUI

struct StudentListView: View {
    
    @State private var students:[Student] = [
        Student(name:"Fernanda", grade:80.00),
        Student(name:"Sam", grade:99.99),
        Student(name:"Luis", grade:10.00)
    ]
    
    //State variable for inputs
    @State private var newStudentName:String = ""
    @State private var newStudentGrade:String = ""
    
    var body: some View {
        List(students, id:\.name) { student in
            Text("\(student.name) - \(student.grade, specifier:"%.2f")")
        }
        HStack{
            TextField("Name:", text:$newStudentName)
                .padding()
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius:8)
                        .stroke(Color.gray, lineWidth:1)
                        .opacity(0.2)
                )
            TextField("Grade:", text:$newStudentGrade)
                .padding()
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius:8)
                        .stroke(Color.gray, lineWidth:1)
                        .opacity(0.2)
                )
            Button("Add"){
                if let grade = Float(newStudentGrade) {
                    let student = Student(name:newStudentName, grade:grade)
                    students.append(student)
                    newStudentName = ""
                    newStudentGrade = ""
                }
            }
            .padding()
        }
        .padding()
        
    }
}

#Preview {
    StudentListView()
}
