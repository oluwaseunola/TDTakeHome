//
//  MainDirectoryView.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-02.
//

import SwiftUI

struct MainDirectoryView: View {
    
    @StateObject private var directoryViewModel : MainDirectoryViewModel = .init(employeeAPIService: APIService(urlString: Constants.employeeUrlString, urlSession: URLSession(configuration: URLSessionConfiguration.ephemeral)))
    
    var body: some View {
        
        switch directoryViewModel.loadState{

        case .loading :
            
            VStack{
                Text("Loading".localized)
                ProgressView()
            }.onAppear {
               Task {
                    await directoryViewModel.fetchEmployees()
                }
            }

        case .loaded:
            
            ZStack{
                NavigationView{
                    DirectoryList()
                        .environmentObject(directoryViewModel)
                }
                // Checks if search text is not empty (the user is searching) and the filtered result is empty
                if !directoryViewModel.searchText.isEmpty && directoryViewModel.filteredEmployees.isEmpty{
                    Text("No results".localized)
                }
            }
            .onChange(of: directoryViewModel.searchText) { _ in
                directoryViewModel.filterSearch()
            }
            
        case .error :
            
            VStack{}
                .alert(isPresented: $directoryViewModel.shouldPresentError, content: {
                    Alert(title: Text("There was an error fetching your contacts, please try again later.".localized), primaryButton: .default(Text("Cancel".localized)), secondaryButton: .default(Text("Refresh".localized)){
                        Task {
                             await directoryViewModel.fetchEmployees()
                         }
                    })
                })
            
        case .empty:
            VStack{
                Text("No contacts to display".localized)
            }
        }
    }
    
}

struct MainDirectoryView_Previews: PreviewProvider {
    static var previews: some View {
        MainDirectoryView()
    }
}
