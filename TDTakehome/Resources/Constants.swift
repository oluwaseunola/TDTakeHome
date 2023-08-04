//
//  Constants.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-02.
//

import Foundation

struct Constants {
    /// Functioning employee endpoint
    static let employeeUrlString: String = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
    /// Malforned employee endpoint
    static let malformedJSON: String = "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json"
    /// Empty employee endpoint
    static let emptyJSON: String = "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json"
    /// Key for setting in UserDefaults if user has been onboarded
    static let onboardKey: String = "onboard"
    /// System Image List
    static let directoryTab: String = "list.bullet"
    /// System Image gear
    static let settingsTab: String = "gear"
    /// System Image envelope
    static let envelopeImage: String = "envelope"
    /// System Image phone
    static let phoneImage: String = "phone"
    /// System Image x button
    static let xImage: String = "multiply.circle.fill"
    /// System Image arrowClockWise
    static let arrowClockWise: String = "arrow.clockwise"
    /// TD logo image 
    static let tdLogo: String = "TDLogo"
    /// Mock employee array
    static let employeeMockArray: [Employee] = [
        Employee(uuid: "", fullName: "Sam Parker", phoneNumber: "1111111", emailAddress: "", biography: "", photoUrlSmall: "", photoUrlLarge: "", team: "Retail", employeeType: ""),
        Employee(uuid: "", fullName: "Jessica Alba", phoneNumber: "1111111", emailAddress: "", biography: "", photoUrlSmall: "", photoUrlLarge: "", team: "Cash", employeeType: "")
    ]
}
