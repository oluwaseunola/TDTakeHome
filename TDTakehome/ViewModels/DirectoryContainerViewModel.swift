//
//  DirectoryContainerViewModel.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-02.
//

import Foundation

final class DirectoryContainerViewModel: ObservableObject{
    /// Determines whether OnboardingView should be visible 
    @Published var shouldPresentOnboarding: Bool = !UserDefaults.standard.bool(forKey: Constants.onboardKey)
}
