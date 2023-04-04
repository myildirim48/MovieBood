//
//  MovieListViewModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 3.04.2023.
//

import Foundation
import Resolver
import Combine

extension MoveListView {

    @MainActor class MovieListViewModel: ObservableObject {
        
        @Injected private var repository: MovieResultRepositoryProtocol
        
        @Published private(set) var popularMovies: [MovieResultUIModel] = []
        @Published private(set) var nowPlayingMovies: [MovieResultUIModel] = []
        @Published private(set) var upComingMovies: [MovieResultUIModel] = []
        @Published private(set) var topRatedMovies: [MovieResultUIModel] = []
        
        @Published public var lastSeenDatapopularMovies : MovieResultUIModel?
        @Published public var lastSeenNowPlayingMovies : MovieResultUIModel?
        @Published public var lastSeenDataupComingMovies : MovieResultUIModel?
        @Published public var lastSeenDatatopRatedMovies : MovieResultUIModel?
        
        private var cancellabes = Set<AnyCancellable>()
        init(){
            $lastSeenNowPlayingMovies.sink { _ in
                
            } receiveValue: { movie in
                guard let movie else { return }
                if movie == self.nowPlayingMovies.last {
                    self.fetchNowPlaying(page: 2)
                }
            }.store(in: &cancellabes)

        }
                
        func nextPageHandler(movie: MovieResultUIModel) {
            
            guard let type = movie.fetchedDataType else { return }
            
            switch type {
            case .popular:
                break
            case .nowPlaying:
                DispatchQueue.main.async {
                    if self.popularMovies.last == movie {
                        self.fetchNowPlaying(page: 2)
                    }
                }
            case .upComing:
                break
            case .topRated:
                break
            }
        }
        
        func fetchMovies(){
            fetchPopularMovies()
            fetchNowPlaying()
            fetchUpComingMovies()
            fetchTopRatedMovies()
        }
        
        #warning("Pagination")
        func pagination(type: FetchedDataType){
            switch type {
            case .popular:
                    fetchPopularMovies(page: 2) 
            case .nowPlaying:
                    fetchNowPlaying()
            case .upComing:
                fetchUpComingMovies(page: 2)
            case .topRated:
                fetchTopRatedMovies(page: 2)
            }
        }
        
        func fetchPopularMovies(page:Int = 1){
            repository.getMovies(page: page, endpoint: .popular, movieListType: .popular) { result in
                switch result {
                case .success(let model):
                    DispatchQueue.main.async {
                        self.popularMovies += model
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    //TODO: - Show the error to user
                }
            }
        }
        
        func fetchNowPlaying(page:Int = 1) {
            repository.getMovies(page: page, endpoint: .nowPlaying, movieListType: .nowPlaying) { result in
                switch result {
                case .success(let model):
                    DispatchQueue.main.async {
                        self.nowPlayingMovies.append(contentsOf: model)
                        self.lastSeenNowPlayingMovies = self.nowPlayingMovies.last
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        func fetchUpComingMovies(page: Int = 1){
            repository.getMovies(page: page, endpoint: .upComing, movieListType: .upComing) { result in
                switch result {
                case .success(let model):
                    DispatchQueue.main.async {
                        self.upComingMovies += model
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        func fetchTopRatedMovies(page: Int = 1){
            repository.getMovies(page: page, endpoint: .topRated, movieListType: .topRated) { result in
                switch result {
                case .success(let model):
                    DispatchQueue.main.async {
                        self.topRatedMovies += model
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}
