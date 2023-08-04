//
//  MockAPIService.swift
//  TDTakehomeTests
//
//  Created by Seun Olalekan on 2023-08-03.
//

import Foundation
@testable import TDTakehome

class MockAPIService : EmployeeAPIService {
    var urlString: String
    var urlSession: URLSession
    
    init(urlString: String, urlSession : URLSession = .shared){
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func fetchEmployees() async throws -> [TDTakehome.Employee] {
        switch urlString{
        case Constants.employeeUrlString:
            return Constants.employeeMockArray
        case Constants.emptyJSON:
            return []
        case Constants.malformedJSON:
            throw APIServiceErrorType.parsingError
        default:
            break
        }
        return []
    }
}

