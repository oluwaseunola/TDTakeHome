//
//  APIErrors.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-02.
//

import Foundation

/// Represents API error cases
enum APIServiceErrorType : Error{
    case invalidURL
    case statusCodeError
    case parsingError
}
