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

            SearchContent(queryString: searchTerm, searchResult: viewModel.searchResult)
                        .navigationTitle("Search")

        }     .onChange(of: searchTerm) { newValue in
            if newValue != " " {
                viewModel.searchMovies(searchQuery: newValue)
            }
        }
                    .searchable(text: $searchTerm,
                                            prompt: "Enter keyword to search")
    }
    struct SearchView_Previews: PreviewProvider {
        static var previews: some View {
            SearchView()
        }
    }
}

struct SearchContent: View {
    var queryString: String
    var searchResult: [MovieSearchUIModel]
    @Environment(\.isSearching) var isSearching // 2
    
    var body: some View {
        VStack {
            if isSearching {
                if searchResult.isEmpty {
                    Text("Searching for the movies....")
                        .font(.system(size: 14,weight: .light))
                        .padding(.top,250)
                }
                List(searchResult) { result in
                    NavigationLink(destination: MovieDetailView(movieID: result.id)){
                        MovieListCell(name: result.titleUI, url: result.imgUrl, releaseData: result.dateUI)
                    }
                }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
                
            }else {
                Text("Search for the movies. \n \n Avatar, God Father etc..")
                    .font(.system(size: 14,weight: .light))
                    .padding(.bottom,350)
            }

            

        }
    }
}
