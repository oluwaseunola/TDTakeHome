//
//  SettingsViewModel.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-03.
//

import Foundation

final class SettingsViewModel {
    
    var version: String = ""
    var name: String = ""
    var bundleID: String = ""
    var creatorName: String = ""
    
    init(){
        getCreatorName()
        getVersion()
        getAppName()
        getBundleID()
    }
    /// Retrieves creator name
    private func getCreatorName(){
        let path = Bundle.main.path(forResource: "Info", ofType: "plist")
        if let path {
            let dict = NSDictionary(contentsOfFile: path)
            
            if let creatorName = dict?.object(forKey: "Creator") as? String{
                self.creatorName = creatorName
            }
        }
    }
    /// Retrieves app version
    private func getVersion(){
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            self.version = version
        }
    }
    /// Retrieves app name
    private func getAppName(){
        if let displayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String{
            self.name = displayName
        }
    }
    /// Retrieves app bundle ID
    private func getBundleID(){
        if let bundleID = Bundle.main.bundleIdentifier {
            self.bundleID = bundleID
        }
    }

    
    
    
    
    
    

    
}
