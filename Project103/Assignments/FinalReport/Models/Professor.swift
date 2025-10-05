//
//  Professor.swift
//  Project103
//
//  Created by Emiliano on 10/4/25.
//

import Foundation
class Professor {
    var firstName:String
    var lastName:String?
    var phone:String?
    
    init(_ firstName:String, _ lastName:String? = nil, _ phone:String? = nil	){
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
    }
}
