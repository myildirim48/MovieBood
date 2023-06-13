//
//  SearchViewModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 15.04.2023.
//

import Foundation
import Resolver

extension SearchView {
    @MainActor class SearchViewModel: ObservableObject {
        @Injected private var repository: MoviesRepositoryProtocol
        
        @Published public var searchResult: [MovieSearchUIModel] = []
        
        func searchMovies(searchQuery: String) async {
            
            guard !searchQuery.isEmpty else {
                self.searchResult = []
                return
            }
            
            do {
                let response = try await repository.searchMovies(page: 1, searchQuery: searchQuery)
                searchResult = response
            } catch {
                return
            }
        }
    }
}
