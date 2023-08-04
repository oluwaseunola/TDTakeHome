//
//  StringExtension.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-03.
//

import Foundation

extension String{
    /// Returns localized string 
    var localized : String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}

