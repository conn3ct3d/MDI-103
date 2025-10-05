//
//  ProfessorListView.swift
//  Project103
//
//  Created by Emiliano on 10/4/25.
//

import SwiftUI

struct ProfessorListView: View {
    
    @State private var professors:[Professor] = [
        Professor("Cornelio", "Mozqueda","7001"),
        Professor("Laura", "Soto", "8002"),
        Professor("Juan", "Guerra", "9003")
    ]
    
    // State variable for inputs
    @State private var newProfessorFirstName:String = ""
    @State private var newProfessorLastName:String = ""
    @State private var newProfessorPhone:String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List(professors, id:\.firstName) { professor in
                    VStack(alignment: .leading) {
                        Text(professor.firstName + " " + (professor.lastName ?? ""))
                            .fontWeight(.bold)
                        Text("Contact: \(professor.phone ?? "N/A")")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
                .listStyle(.insetGrouped)
                
                VStack(spacing: 15) {
                    Text("Add a New Professor")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    TextField("First Name", text:$newProfessorFirstName)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    TextField("Last Name (Optional)", text:$newProfessorLastName)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    TextField("Phone Number (Optional)", text:$newProfessorPhone)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    Button("Add Professor"){
                        if !newProfessorFirstName.isEmpty{
                            
                            let newProfessor = Professor(
                                newProfessorFirstName,
                                newProfessorLastName.isEmpty ? nil : newProfessorLastName,
                                newProfessorPhone.isEmpty ? nil : newProfessorPhone
                            )
                            professors.append(newProfessor)
                            
                            newProfessorFirstName = ""
                            newProfessorLastName = ""
                            newProfessorPhone = ""
                        }
                    }
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(color: .blue.opacity(0.3), radius: 5, y: 3)
                }
                .padding()
            }
            .navigationTitle("Professor Directory")
        }
    }
}

#Preview {
    ProfessorListView()
}
