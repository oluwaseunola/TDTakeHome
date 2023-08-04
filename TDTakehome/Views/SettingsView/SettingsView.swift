//
//  SettingsView.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-02.
//

import SwiftUI

struct SettingsView: View {
    private var settingsViewModel: SettingsViewModel = .init()
    var body: some View {
        Text("\(settingsViewModel.creatorName) \n \(settingsViewModel.name) \n  \(settingsViewModel.version) \n \(settingsViewModel.bundleID)")
            .multilineTextAlignment(.center)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
