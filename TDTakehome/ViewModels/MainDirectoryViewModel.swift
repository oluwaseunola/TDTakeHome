//
//  DirectoryViewModel.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-02.
//

import Foundation
import UIKit

/// Represents state of EmployeeAPIService
enum LoadState {
    case loading,loaded, empty, error
}

final class MainDirectoryViewModel: ObservableObject {
    var employeeAPIService: EmployeeAPIService
    /// Employee array
    @Published var employees: [Employee] = []
    /// Represents state of EmployeeAPIService
    @Published var loadState: LoadState = .loading
    /// Array of filtered Employee types
    @Published var filteredEmployees : [Employee] = []
    /// Search text for search bar
    @Published var searchText: String = ""
    /// Toggles error alert
    @Published var shouldPresentError: Bool = false
    /// Boolean representing if user is searching in search bar
    @Published var isSearching : Bool = false
    
    init(employeeAPIService : EmployeeAPIService){
        self.employeeAPIService = employeeAPIService
    }
    
    @MainActor
    /// Fetches employees from EmployeeAPIService
    func fetchEmployees() async {
        loadState = .loading
        
        do{
            let fetchedEmployees = try await employeeAPIService.fetchEmployees()
            
                if fetchedEmployees.isEmpty{
                    loadState = .empty
                }else{
                    employees = fetchedEmployees.sorted{$0.fullName < $1.fullName}
                    loadState = .loaded
                }
        }catch{
            shouldPresentError = true
            loadState = .error
        }
    }
    
    /// Filters employee array based on employee name or team
    func filterSearch(){
        if !searchText.isEmpty {
            filteredEmployees = employees.filter{$0.fullName.lowercased().contains(searchText.lowercased()) || $0.team.lowercased().contains(searchText.lowercased()) }
        }
    }
    /// Resigns first responder and dismisses keyboard
    func cancelSearch(){
        isSearching = false
        searchText = ""
        // Dismiss the keyboard
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
