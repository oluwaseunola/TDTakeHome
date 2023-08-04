//
//  OnboardingViewModelTests.swift
//  TDTakehomeTests
//
//  Created by Seun Olalekan on 2023-08-03.
//

import XCTest
@testable import TDTakehome

final class OnboardingViewModelTests: XCTestCase {
    
    func testOnboardingViewModelTests_WhenUserTapsGetStarted_UserDefaultsBooleanIsSetToTrueAndViewIsDismissed(){
        // Arrange
        let sut = OnboardingViewModel()
        // Mimic initial false state of user onboarding
        UserDefaults.standard.set(false, forKey: Constants.onboardKey)
        let onboardedValue = UserDefaults.standard.bool(forKey: Constants.onboardKey)
        XCTAssertFalse(onboardedValue)
        var isPresented: Bool = true
        
        // Act
        sut.setOnboardingStatus(&isPresented)
        
        // Assert
        let newOnboardedValue = UserDefaults.standard.bool(forKey: Constants.onboardKey)
        XCTAssertTrue(newOnboardedValue)
        XCTAssertFalse(isPresented)

    }
    
}
