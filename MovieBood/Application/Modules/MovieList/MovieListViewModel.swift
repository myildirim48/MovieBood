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
//                    Task {
//                        await self.fetchMovies()
//                    }
                    self.fetchMovies()
                }
            }.store(in: &cancellabes)
        }
        
        func fetchMovies() {
            guard let movieType = lastNowPlayingMovie?.fetchedDataType else {
//                await MoviesListEndPoints.allCases.asyncForEach({ type in
//                    await fetchMovies(endpoint: type, movieListType: type.dataType)
//
//                })
                MoviesListEndPoints.allCases.forEach { type in
                    Task {
                        await fetchMovies(endpoint: type, movieListType: type.dataType)
                    }
                }
                return
            }
            Task { await fetchMovies(endpoint: .init(rawValue: movieType.rawValue)!, movieListType: movieType)}
        }
        
        func fetchMovies(endpoint: MoviesListEndPoints, movieListType: FetchedDataType) async {
            
            if let totalPages = repository.totalPages[endpoint.dataType]{
                if self.currentPages[endpoint.dataType] ?? 1 <= totalPages {
                    self.currentPages[endpoint.dataType] = (self.currentPages[endpoint.dataType] ?? 1) + 1
                }
            }
            
            let page = self.currentPages[endpoint.dataType] ?? 1
           
            do {
                let response = try await repository.getMovies(page: page, endpoint: endpoint, movieListType: endpoint.dataType)
                if self.movies[movieListType] == nil {
                    self.movies[movieListType] = self.movies[movieListType] ?? [] + response
                }else {
                    self.movies[movieListType]?.append(contentsOf: response)
                }
                self.nowPlayingMovies[movieListType] = self.movies[movieListType]?.last
            } catch {
                //TODO: - Show alert to user
            }
        }
    }
}
