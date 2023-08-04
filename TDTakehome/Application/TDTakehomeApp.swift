//
//  TDTakehomeApp.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-02.
//

import SwiftUI

@main
struct TDTakehomeApp: App {
    init(){
        //Adjusts navigation title width for very long titles in entire app
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
    }

    var body: some Scene {
        WindowGroup {
            DirectoryContainerView()
        }
    }
}
