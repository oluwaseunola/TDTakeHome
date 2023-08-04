//
//  MainDirectoryViewModelTests.swift
//  TDTakehomeTests
//
//  Created by Seun Olalekan on 2023-08-03.
//

import XCTest
@testable import TDTakehome

final class MainDirectoryViewModelTests: XCTestCase {
    var sut : MainDirectoryViewModel!
    
    override func setUpWithError() throws {
        sut = MainDirectoryViewModel(employeeAPIService: MockAPIService(urlString: Constants.employeeUrlString))
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testMainDirectoryViewModel_WhenGivenNormalEndpoint_LoadStateIsLoaded() async {
        // arrange
        sut.employeeAPIService =  MockAPIService(urlString: Constants.employeeUrlString)
        
        //act
        await sut.fetchEmployees()
        
        // assert
        XCTAssertEqual(sut.loadState, .loaded)
        XCTAssertNotEqual(sut.loadState, .empty)
        XCTAssertNotEqual(sut.loadState, .loading)
        XCTAssertNotEqual(sut.loadState, .error)
    }
    
    func testMainDirectoryViewModel_WhenGivenEmptyEndpoint_LoadStateIsEmpty() async {
        // arrange
        sut.employeeAPIService =  MockAPIService(urlString: Constants.emptyJSON)

        //act
        await sut.fetchEmployees()
        
        // assert
        XCTAssertEqual(sut.loadState, .empty)
        XCTAssertNotEqual(sut.loadState, .loaded)
        XCTAssertNotEqual(sut.loadState, .loading)
        XCTAssertNotEqual(sut.loadState, .error)
    }
    
    func testMainDirectoryViewModel_WhenGivenMalformedEndpoint_LoadStateIsError() async {
        // arrange
        sut.employeeAPIService =  MockAPIService(urlString: Constants.malformedJSON)
        
        //act
        await sut.fetchEmployees()
        
        // assert
        XCTAssertEqual(sut.loadState, .error)
        XCTAssertNotEqual(sut.loadState, .loaded)
        XCTAssertNotEqual(sut.loadState, .loading)
        XCTAssertNotEqual(sut.loadState, .empty)
    }
    
    
    func testMainDirectoryViewModel_GivenSearchText_CreatesFilterdArray() {
        // arrange
        let sam = "Sam Parker"
        let jessica = "Jessica Alba"
        sut.employees = Constants.employeeMockArray
        sut.searchText = jessica
    
        //act
        sut.filterSearch()
        
        // assert
        
        XCTAssertTrue(sut.filteredEmployees.contains(where: { $0.fullName == jessica}))
        XCTAssertFalse(sut.filteredEmployees.contains(where: { $0.fullName == sam}))
    }
    
    func testMainDirectoryViewModel_WhenCancelSearchTriggered_ClearsSearchTextAndStopsSearching(){
        // arrange
        sut.searchText = "Jessica"
        sut.isSearching = true
        // Ensure initial status is set up correctly
        XCTAssertEqual(sut.searchText, "Jessica")
        XCTAssertTrue(sut.isSearching)
        
        // act
        sut.cancelSearch()
        
        // assert
        XCTAssertEqual(sut.searchText, "")
        XCTAssertFalse(sut.isSearching)

    }
    
    

}
