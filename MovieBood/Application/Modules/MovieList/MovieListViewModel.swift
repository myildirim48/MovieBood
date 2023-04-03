//
//  MovieListViewModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 3.04.2023.
//

import Foundation
import Resolver

extension MovelistView {

    @MainActor class MovieListViewModel: ObservableObject {
        
        @Injected private var repository: MovieResultRepositoryProtocol
        
        @Published private(set) var popularMovies: [MovieResultUIModel] = []
        @Published private(set) var nowPlayingMovies: [MovieResultUIModel] = []
        @Published private(set) var upComingMovies: [MovieResultUIModel] = []
        @Published private(set) var topRatedMovies: [MovieResultUIModel] = []
        
        
        
        func fetchMovies(){
            fetchPopularMovies()
            fetchNowPlaying()
            fetchUpComingMovies()
            fetchTopRatedMovies()
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
                        self.nowPlayingMovies += model
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
