//
//  Assignment2.swift
//  Project103
//
//  Created by Emiliano on 10/3/25.
//
import SwiftUI

struct Student: Identifiable {
    let id = UUID()
    let name: String
    let grade: Double
}

struct Assignment2: View {
    @State private var students: [Student] = [
        Student(name: "JAke", grade: 84.33),
        Student(name: "Louis", grade: 91.67),
        Student(name: "Ralph", grade: 78.50),
        Student(name: "Martha", grade: 97.60),
        Student(name: "Rachel", grade: 100.00)
    ]
    
    @State private var newStudentName: String = ""
    @State private var newStudentGrade: String = ""
    
    var courseAverage: Double {
        if students.isEmpty {
            return 0.0
        }
        let totalGrade = students.reduce(0) { $0 + $1.grade }
        return totalGrade / Double(students.count)
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Text("Student Grades")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.blue)
                        .padding(.top)

                    Text("Course Average: \(courseAverage, specifier: "%.2f")")
                        .font(.headline)
                        .padding(.bottom)
                    
                    List {
                        ForEach(students) { student in
                            HStack {
                                Text(student.name)
                                Spacer()
                                Text(String(format: "%.2f", student.grade))
                                    .fontWeight(.medium)
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .scrollContentBackground(.hidden)
                    
                    VStack {
                        Divider()
                        HStack {
                            TextField("New Student Name", text: $newStudentName)
                                .padding(8)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.4), lineWidth: 1))
                            
                            TextField("Grade", text: $newStudentGrade)
                                .padding(8)
                                .frame(width: 80)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.4), lineWidth: 1))

                            Button(action: addStudent) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title)
                                    .foregroundStyle(.green)
                            }
                            .disabled(newStudentName.isEmpty || newStudentGrade.isEmpty)
                        }
                        .padding()
                    }
                    .background(Color.white)
                    
                } // END - VStack
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .padding()
                
            } // END - ZStack
            .navigationBarTitle("GradeBook", displayMode: .inline)
            .toolbar {
                Menu {
                    Button("Sort by Grade (Ascending)") {
                        sortByGradeAscending()
                    }
                    Button("Sort by Grade (Descending)") {
                        sortByGradeDescending()
                    }
                    Button("Sort by Name (A-Z)") {
                        sortByName()
                    }
                } label: {
                    Image(systemName: "arrow.up.arrow.down.circle")
                        .imageScale(.large)
                }
                .padding()
            }
        } // END - NavigationView
    } // END - Body

    private func addStudent() {
        guard !newStudentName.isEmpty, let grade = Double(newStudentGrade) else {
            return
        }
        
        // Create the new student and append to the array
        let newStudent = Student(name: newStudentName, grade: grade)
        students.append(newStudent)
        
        newStudentName = ""
        newStudentGrade = ""
    }
    
    func sortByName() {
        students.sort { $0.name < $1.name }
    }

    func sortByGradeAscending() {
        students.sort { $0.grade < $1.grade }
    }

    func sortByGradeDescending() {
        students.sort { $0.grade > $1.grade }
    }
} // END - Assignment2 View

#Preview {
    Assignment2()
}
