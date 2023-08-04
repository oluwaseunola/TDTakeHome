//
//  DirectoryList.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-03.
//

import SwiftUI

struct DirectoryList: View {
    
    @EnvironmentObject private var directoryViewModel : MainDirectoryViewModel
    
    var body: some View {
        if #available(iOS 15.0, *) {
            content
                .refreshable {
                    await directoryViewModel.fetchEmployees()
                }
        }else{
            content
        }
    }
    
    private var content : some View {
        ScrollView{
        // SearchBar
            SearchBar(searchText: $directoryViewModel.searchText, isSearching: $directoryViewModel.isSearching){
                directoryViewModel.cancelSearch()
            }
            
            if #unavailable (iOS 15.0) {
                Button {
                    Task{
                        await directoryViewModel.fetchEmployees()
                    }
                    
                } label: {
                    HStack{
                        Image(systemName: Constants.arrowClockWise)
                        Text("Refresh".localized)
                    }
                }
            }
        
        ForEach( directoryViewModel.searchText.isEmpty ? directoryViewModel.employees : directoryViewModel.filteredEmployees ) { employee in
            // Nav link to DetailView
            NavigationLink {
                EmployeeDetailView(fullName: employee.fullName, bio:employee.biography, photo: employee.photoUrlLarge, team: employee.team, emailAddress: employee.emailAddress, phoneNumber: employee.phoneNumber)
            } label: {
                // Employee Cell
                DirectoryEmployeeCell(fullName: employee.fullName, photo: employee.photoUrlSmall, team: employee.team, emailAddress: employee.emailAddress, phoneNumber: employee.phoneNumber)
            }
        }
    }
    .frame(maxWidth:.infinity)
    .navigationTitle("Employee Directory".localized)

    }
}

struct DirectoryList_Previews: PreviewProvider {
    static var previews: some View {
        DirectoryList()
    }
}
