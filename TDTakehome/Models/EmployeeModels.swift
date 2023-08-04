//
//  EmployeeModels.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-02.
//

import Foundation

struct EmployeeData : Codable{
    var employees : [Employee]
}

struct Employee : Codable, Identifiable,Equatable{
    
    let id = UUID()
    let uuid : String
    let fullName : String
    let phoneNumber : String
    let emailAddress : String
    let biography : String
    let photoUrlSmall : String
    let photoUrlLarge : String
    let team : String
    let employeeType : String
    
}
