//
//  SettingsVIewModelTests.swift
//  TDTakehomeTests
//
//  Created by Seun Olalekan on 2023-08-03.
//

import XCTest
@testable import TDTakehome

final class SettingsViewModelTests: XCTestCase {

    func testSettingsViewModel_WhenInitialized_SetsAllStringValues(){
        //arrange
        let sut = SettingsViewModel()
        
        //assert
        
        XCTAssertNotEqual(sut.bundleID, "")
        XCTAssertNotEqual(sut.creatorName, "")
        XCTAssertNotEqual(sut.name, "")
        XCTAssertNotEqual(sut.version, "")
    }

}
