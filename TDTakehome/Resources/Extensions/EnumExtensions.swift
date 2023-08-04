//
//  EnumExtensions.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-03.
//

import Foundation

extension LoadState : Equatable {
    static func == (lhs: LoadState, rhs: LoadState) -> Bool {
        switch (lhs,rhs){
        case (.empty, .empty):
            return true
        case (.error, .error):
            return true
        case (.loaded,.loaded):
            return true
        case (.loading,.loading):
            return true
        default:
            return false
        }
    }
    
    
}

