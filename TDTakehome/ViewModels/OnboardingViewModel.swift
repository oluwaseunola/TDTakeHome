//
//  OnboardingViewModel.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-02.
//

import Foundation

final class OnboardingViewModel {
    /// Sets boolean value for if OnboardingView has been presented
    /// - Parameter isPresented: Value for whether to dismiss OnboardingView
    func setOnboardingStatus(_ isPresented: inout Bool){
        UserDefaults.standard.set(true, forKey: Constants.onboardKey)
        isPresented = false
    }
}
