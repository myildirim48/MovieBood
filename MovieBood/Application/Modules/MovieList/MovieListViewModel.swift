//
//  MovieListViewModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 3.04.2023.
//

import Foundation
import Resolver
import Combine
import SwiftUI

extension MoveListView {
    
    @MainActor class MovieListViewModel: ObservableObject {
        
        @Injected private var repository: MovieResultRepositoryProtocol
        
        @Published private(set) var nowPlayingMovies: [FetchedDataType:MovieResultUIModel] = [:]
        @Published public var lastNowPlayingMovie: MovieResultUIModel?
        @Published public var movies: [FetchedDataType: [MovieResultUIModel]] = [:]
        
        private var pagesCount: [FetchedDataType: Int ] = [:]
        
        private var cancellabes = Set<AnyCancellable>()
        init(){
            $lastNowPlayingMovie.sink { _ in
                
            } receiveValue: { movie in
                guard let movie else { return }
                
                if movie == self.nowPlayingMovies[movie.fetchedDataType!] {
                    self.fetchMovies()
                }
            }.store(in: &cancellabes)
            
        }
        
        func fetchMovies(){
            
            guard let movieType = lastNowPlayingMovie?.fetchedDataType else {
                MoviesListEndPoints.allCases.forEach { type in
                    fetchMovies(endpoint: type, movieListType: type.dataType)
                }
                return
            }
            fetchMovies(endpoint: .init(rawValue: movieType.rawValue)!, movieListType: movieType)
        }
        
        func fetchMovies(endpoint: MoviesListEndPoints, movieListType: FetchedDataType) {
            
            var page = (pagesCount[endpoint.dataType] ?? 0) + 1
            
            repository.getMovies(page: page, endpoint: endpoint, movieListType: endpoint.dataType) { result in
                switch result {
                case .success(let model):
                    
                    DispatchQueue.main.async {
                        self.movies[movieListType] = self.movies[movieListType] ?? [] + model
                        page += 1
                        self.pagesCount[endpoint.dataType] = self.pagesCount[endpoint.dataType] ?? 0 + 1
                        self.nowPlayingMovies[movieListType] = self.movies[movieListType]?.last
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    //TODO: - Show the error to user
                }
            }
        }
    }
}
