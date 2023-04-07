//
//  MovieDetailUIModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 6.04.2023.
//

import Foundation
struct MovieDetailUIModel:Equatable,MockableModel {
    
    let id: Int
    let title: String?
    
    private let backdropPath: String?
    private let posterPath: String?
    let overview: String?
    private let voteAverage: Double?
    let voteCount: Int?
    private let runtime: Int?
    let releaseDate: String?
    private let profilePath: String?
    let tagline: String?
    private let originalLanguage: String?
    private let genres: [Genre]?


    let credits: MovieCredit?
    let videos: MovieVideoResponse?
    
    static func == (lhs: MovieDetailUIModel, rhs: MovieDetailUIModel) -> Bool {
        lhs.id == rhs.id
    }
    
    var imgUrl: String {
            return AppConfig.imageURL + (backdropPath ?? "")
    }
    var runtimeUI: String {
        let hour = String((runtime ?? 0) / 60)
        let mins = String((runtime ?? 0) % 60)
        
        return"\(hour) hours \(mins) mins"
        
    }
    
    var genresUI: String {
        return genres?.map({ $0.name }).joined(separator: ", ") ?? ""
    }
    
    var voteAvarageUI: String{
        return String(voteAverage ?? 0.0)
    }
//    func runtimeToString() -> String {
//        
//    }
    
    var originalLanguageUI: String{
        return originalLanguage?.uppercased() ?? ""
    }
    
    
    //MARK: - Credits,Videos
    var cast: [MovieCast]? {
        credits?.cast
    }
    
    var crew: [MovieCrew]? {
        credits?.crew
    }
    
    var directors: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "director" }
    }
    
    var producers: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "producer" }
    }
    
    var screenWriters: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "story" }
    }
    
    var youtubeTrailers: [MovieVideo]? {
        videos?.results.filter { $0.youtubeURL != nil }
    }
    
    //Rating,Score
    var ratingTextUI: String {
        let rating = Int(voteAverage ?? 0)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    
    var scoreTextUi: String {
        guard ratingTextUI.count > 0 else {
            return "n / a"
        }
        return "\(ratingTextUI.count) / 10"
    }
    
    
    //MARK: - Mockdata
    
    
       static var mock:Self {
           return MovieDetailUIModel(id: 123, title: "titleMock", backdropPath: "", posterPath: "", overview: "overviewMock", voteAverage: 12.3, voteCount: 12, runtime: 120, releaseDate: "12-03-1962", profilePath: "", tagline: "TaglineMock", originalLanguage: "en", genres: [.init(id: 1, name: "Dram")], credits: MovieCredit?.none, videos: MovieVideoResponse?.none)
       }
    
    static func convert(from response: MovieDetailModel) -> MovieDetailUIModel {
            
        return MovieDetailUIModel(id: response.id, title: response.title, backdropPath: response.backdropPath, posterPath: response.posterPath, overview: response.overview, voteAverage: response.voteAverage, voteCount: response.voteCount, runtime: response.runtime, releaseDate: response.releaseDate, profilePath: response.profilePath, tagline: response.tagline, originalLanguage: "en", genres: response.genres, credits: response.credits, videos: response.videos)
        
    }
}
