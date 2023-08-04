//
//  OnboardingView.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-02.
//

import SwiftUI

struct OnboardingView: View {
    private let onboardingViewModel : OnboardingViewModel = .init()
    @Binding var isPresented : Bool
    
    var body: some View {
        ZStack{
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:10){
                Text("Welcome to Employee Directory!".localized)
                Button("Lets get started".localized) {
                    onboardingViewModel.setOnboardingStatus(&isPresented)
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(isPresented: .constant(false))
    }
}
