//
//  DirectoryContainerView.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-04.
//

import SwiftUI

struct DirectoryContainerView: View {
    @StateObject private var directoryContainerViewModel : DirectoryContainerViewModel = .init()
    var body: some View {
        ZStack{
            TabView {
                MainDirectoryView()
                    .tabItem {
                        Image(systemName: Constants.directoryTab)
                        Text("Directory".localized)
                    }
                
                SettingsView()
                    .tabItem {
                        Image(systemName: Constants.settingsTab)
                        Text("Info".localized)
                    }
            }
            // If OnboardingView can still present (based off UserDefaults value), show OnboardingView
            if directoryContainerViewModel.shouldPresentOnboarding {
                OnboardingView(isPresented: $directoryContainerViewModel.shouldPresentOnboarding)
            }
        }
    }
}

struct DirectoryContainerView_Previews: PreviewProvider {
    static var previews: some View {
        DirectoryContainerView()
    }
}
