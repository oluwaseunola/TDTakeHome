//
//  SearchBar.swift
//  TDTakehome
//
//  Created by Seun Olalekan on 2023-08-02.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    var cancelSearch : ()->Void

    var body: some View {
        HStack {
            TextField("Search".localized, text: $searchText, onEditingChanged: { isEditing in
                withAnimation(.easeOut){
                    isSearching = isEditing
                }
            })
            .padding(.leading, 24)
            .overlay(
                HStack {
                    Spacer()
                    
                    if isSearching {
                        Button(action: {
                            searchText = ""
                        }) {
                            Image(systemName: Constants.xImage)
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                }
            )
            .padding(.vertical, 8)
            .background(Color(.systemGray6))
            .cornerRadius(10)

            if isSearching {
                Button(action: {
                    withAnimation(.easeInOut){
                        cancelSearch()
                    }
                }) {
                    Text("Cancel".localized)
                }
                .padding(.trailing, 8)
            }
        }
        .padding(.horizontal)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""), isSearching: .constant(false), cancelSearch: {})
    }
}
