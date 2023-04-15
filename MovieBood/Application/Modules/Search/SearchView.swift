//
//  SearchView.swift
//  MovieBood
//
//  Created by YILDIRIM on 31.03.2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel = SearchViewModel()
    @State private var searchTerm = ""
    
    var body: some View {
        
        NavigationView {
                List(viewModel.searchResult) { result in
                    NavigationLink(destination: MovieDetailView(movieID: result.id)){
                        MovieListRow(name: result.titleUI, url: result.imgUrl, releaseData: result.dateUI)
                    }
                }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .searchable(text: $searchTerm,
                                    prompt: "Enter keyword to search",
                                    suggestions: {
                            Text("Avatar").searchCompletion("avatar")
                        })
            .onChange(of: searchTerm) { newValue in
                if newValue != " " {
                    viewModel.searchMovies(searchQuery: newValue)
                }
            }
            .navigationTitle("Search")
        }
    }
    struct SearchView_Previews: PreviewProvider {
        static var previews: some View {
            SearchView()
        }
    }
}
