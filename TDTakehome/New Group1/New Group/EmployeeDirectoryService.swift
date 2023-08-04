//
//  EmployeeDirectoryService.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-02.
//

import Foundation

protocol EmployeeAPIService {
    var urlString : String { get set }
    var urlSession : URLSession { get set }
    func fetchEmployees() async throws -> [Employee]}

final class APIService : EmployeeAPIService{
    /// String representing endpoint
    var urlString : String
    /// URL session
    var urlSession : URLSession
    
    init(urlString: String, urlSession : URLSession = .shared){
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    /// Fetches employees from endpoint
    /// - Returns: Array of Employee types
    func fetchEmployees() async throws -> [Employee] {
        urlSession.configuration.timeoutIntervalForRequest = 30
        guard let url = URL(string: urlString) else {
            // Invalid URL error
            throw APIServiceErrorType.invalidURL
        }

        let (data, response) = try await urlSession.data(from: url)
        
        guard let res = response as? HTTPURLResponse, res.statusCode == 200 else{
            // Status code error
            throw APIServiceErrorType.statusCodeError
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let employeeData = try? decoder.decode(EmployeeData.self, from: data) else {
            // JSON Parsing error
            throw APIServiceErrorType.parsingError
        }

        return employeeData.employees

    }
    
    
}


