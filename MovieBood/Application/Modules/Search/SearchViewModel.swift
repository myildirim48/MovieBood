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
        
        func searchMovies(searchQuery: String) {
                        
            repository.searchMovies(page: 1, searchQuery: searchQuery) { result in
                switch result {
                case .success(let success):
                    DispatchQueue.main.async {
                            self.searchResult = success
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                    //TODO: - Show the error to user

                }
            }
        }
    }
}
