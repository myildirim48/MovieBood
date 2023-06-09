//
//  MovieDetailModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 6.04.2023.
//

import Foundation

struct MovieDetailModel: Codable, Equatable {

    let id: Int
    let title: String?
    
    let backdropPath: String?
    let posterPath: String?
    let overview: String?
    let voteAverage: Double?
    let voteCount: Int?
    let runtime: Int?
    let releaseDate: String?
    let tagline: String?
    let originalLanguage: String?
    let genres: [Genre]?

    
    let credits: MovieCredit?
    let videos: MovieVideoResponse?
    
    static func == (lhs: MovieDetailModel, rhs: MovieDetailModel) -> Bool {
        lhs.id == rhs.id
    }
    
}

//MARK: - SpecialDataTypes
struct MovieGenre: Codable {
    let name: String
}

struct MovieCredit: Codable, Equatable {
    let cast: [MovieCast]
    let crew: [MovieCrew]
}

struct MovieCast: Codable, Identifiable, Equatable {
    let id: Int
    let character: String
    let name: String
    let profilePath: String?

}

struct MovieCrew: Codable, Identifiable, Equatable {
    let id: Int
    let job: String
    let name: String
    let profilePath: String?
}

struct MovieVideoResponse: Codable, Equatable {
    let results: [MovieVideo]
}

struct Genre: Codable {
    let id: Int
    let name: String
}

struct MovieVideo: Codable, Identifiable, Equatable{
    let id: String
    let key: String?
    let type: String?

    private let site: String?
    
    var youtubeURL: URL? {
        guard site == "YouTube"  && type == "Featurette" else {
            return nil
        }
        return URL(string: "https://www.youtube.com/watch?v=\(key ?? "")")
    }
}
