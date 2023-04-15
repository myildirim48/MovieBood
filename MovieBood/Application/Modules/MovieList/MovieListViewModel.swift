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

extension MovieListView {
    
    @MainActor class MovieListViewModel: ObservableObject {
        
        @Injected private var repository: MoviesRepositoryProtocol
        
        @Published private(set) var nowPlayingMovies: [FetchedDataType:MoviesUIModel] = [:]
        @Published public var lastNowPlayingMovie: MoviesUIModel?
        @Published public var movies: [FetchedDataType: [MoviesUIModel]] = [:]
            
        private var currentPages: [FetchedDataType: Int ] = [:]
        
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
            
            if let totalPages = repository.totalPages[endpoint.dataType]{
                if self.currentPages[endpoint.dataType] ?? 1 <= totalPages {
                    self.currentPages[endpoint.dataType] = (self.currentPages[endpoint.dataType] ?? 1) + 1
                }
            }
            
            let page = self.currentPages[endpoint.dataType] ?? 1

            repository.getMovies(page: page, endpoint: endpoint, movieListType: endpoint.dataType) { result in
                switch result {
                case .success(let model):
                    
                    DispatchQueue.main.async {
                        if self.movies[movieListType] == nil {
                            self.movies[movieListType] = self.movies[movieListType] ?? [] + model
                        }else {
                            self.movies[movieListType]?.append(contentsOf: model)
                        }
                        print(movieListType.title ,"Current Page: ", page ," \n Total Data : " ,self.movies[movieListType]!.count)

                        self.nowPlayingMovies[movieListType] = self.movies[movieListType]?.last
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}
