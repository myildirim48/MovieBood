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
    private let releaseDate: String?
    let tagline: String?
    private let originalLanguage: String?
    private let genres: [Genre]?
    
    
    let credits: MovieCredit?
    let videos: MovieVideoResponse?
    
    static func == (lhs: MovieDetailUIModel, rhs: MovieDetailUIModel) -> Bool {
        lhs.id == rhs.id
    }
    
    var imgUrl: String {
        return AppConfig.imageURL + (posterPath ?? "")
    }
    //MARK: - Youtube
    
    var runtimeUI: String {
        let hour = String((runtime ?? 0) / 60)
        let mins = String((runtime ?? 0) % 60)
        
        return"\(hour) hours \(mins) mins"
        
    }
    
    var genresUI: String {
        return genres?.map({ $0.name }).joined(separator: ", ") ?? ""
    }
    
    var voteAvarageUI: String{
        return String(format: "%.1f", voteAverage ?? 0.0)
    }
    
    var originalLanguageUI: String{
        return originalLanguage?.uppercased() ?? ""
    }
    
    var videosUI: Bool{
        return ((videos?.results.isEmpty) != nil)
    }
    
    var releaseDateUI: String {
        guard let date = releaseDate?.transformStringToDate().dateToString() else { return "n / a"}
        return date
    }

    
    
    //MARK: - Credits,Videos
    var cast: [MovieCast]? {
        credits?.cast
    }
    
    
    func convert(from movieCast:[MovieCast]?) -> [MovieCrew]{
        
        guard let cast = movieCast else  {
            return [MovieCrew(id: 1, job: "DetailUIModel", name: "Detail UI Model", profilePath: "No-URL")]
        }
        
        return cast.map { model in
            return MovieCrew(id: model.id, job: model.character, name: model.name, profilePath: model.profilePath)
        }

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
    var editor: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "editor" }
    }
    var story: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "story" }
    }
    
    var youtubeTrailers: [MovieVideo]? {
        videos?.results.filter { $0.youtubeURL != nil }
    }
    
    
    
    //MARK: - Mockdata
    
    
    static var mock:Self {
        return MovieDetailUIModel(id: 123, title: "titleMock", backdropPath: "", posterPath: "", overview: "overviewMock", voteAverage: 12.3, voteCount: 12, runtime: 120, releaseDate: "12-03-1962", tagline: "TaglineMock", originalLanguage: "en", genres: [.init(id: 1, name: "Dram")], credits: MovieCredit?.none, videos: MovieVideoResponse?.none)
    }
    
    static func convert(from response: MovieDetailModel) -> MovieDetailUIModel {
        
        return MovieDetailUIModel(id: response.id, title: response.title, backdropPath: response.backdropPath, posterPath: response.posterPath, overview: response.overview, voteAverage: response.voteAverage, voteCount: response.voteCount, runtime: response.runtime, releaseDate: response.releaseDate, tagline: response.tagline, originalLanguage: "en", genres: response.genres, credits: response.credits, videos: response.videos)
        
    }
}

