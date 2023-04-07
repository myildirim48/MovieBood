//
//  MovieDetailViewModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 4.04.2023.
//

import Foundation
import Resolver
import SwiftUI

extension MovieDetailView {

    @MainActor class MovieDetailViewModel: ObservableObject {
        
        @Injected private var repository: MoveDetailRepositoryProtocol
        
        @Published public var movie: MovieDetailUIModel = MovieDetailUIModel.mock
        
        @Published public var team: [CrewType:[MovieCrew]] = [:]
        
        func fetchDetails(movieID:Int){
            
            repository.getMvoeiDetail(movieID: String(movieID)) { result in
                switch result {
                case .success(let movie):
                    DispatchQueue.main.async {
                        self.movie = movie
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        func matchTeam(movie: MovieDetailUIModel){
            CrewType.allCases.forEach { type in
                
            }
        }
    }
}

enum CrewType: String, CaseIterable {
    case crew, directors, producers, screenWriters

    var title : String {
        switch self {
        case .crew:
            return "Crew"
        case .directors:
            return "Director"
        case .producers:
            return "Producer"
        case .screenWriters:
            return "Screen Writers"
        }
    }
}
