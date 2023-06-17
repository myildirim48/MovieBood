//
//  MovieDetailUIModelConverterTests.swift
//  MovieBoodTests
//
//  Created by YILDIRIM on 14.06.2023.
//

import XCTest
@testable import MovieBood

final class MovieDetailUIModelConverterTests: XCTestCase {
    
    var sut = MovieDetailUIModel.self
    
    func testMovieDetailConvertToUIModelCorrectly() throws {
        //        Given
        let movieDetail = Bundle(for: MovieDetailUIModelConverterTests.self).decode(MovieDetailModel.self, from: "moviedetail")
        //        When
        let convertedUI = try XCTUnwrap(sut.convert(from:movieDetail))
        //        Then
        XCTAssertEqual(convertedUI.id, movieDetail.id)
        XCTAssertEqual(convertedUI.title, movieDetail.title)
        XCTAssertEqual(convertedUI.overview, movieDetail.overview)
        XCTAssertEqual(convertedUI.voteCount, movieDetail.voteCount)
        XCTAssertEqual(convertedUI.tagline, movieDetail.tagline)
        XCTAssertEqual(convertedUI.credits, movieDetail.credits)
        XCTAssertEqual(convertedUI.videos, movieDetail.videos)
        XCTAssertEqual(convertedUI.imgUrl, AppConfig.imageURL + (movieDetail.posterPath!))
        XCTAssertEqual(convertedUI.runtimeUI, "\(String(movieDetail.runtime! / 60)) hours \(String(movieDetail.runtime! % 60)) mins")
        XCTAssertEqual(convertedUI.genresUI, movieDetail.genres?.map({ $0.name }).joined(separator: ", "))
        XCTAssertEqual(convertedUI.voteAvarageUI, "\(String(format: "%.1f", movieDetail.voteAverage!))")
        XCTAssertEqual(convertedUI.originalLanguageUI, movieDetail.originalLanguage?.uppercased())
        XCTAssertEqual(convertedUI.videosUI, movieDetail.videos?.results.isEmpty != nil)
        XCTAssertEqual(convertedUI.releaseDateUI, movieDetail.releaseDate?.transformStringToDate().dateToString())
        XCTAssertEqual(convertedUI.cast, movieDetail.credits?.cast)
        XCTAssertEqual(convertedUI.crew, movieDetail.credits?.crew)
        XCTAssertEqual(convertedUI.directors, movieDetail.credits?.crew.filter { $0.job.lowercased() == "director" })
        XCTAssertEqual(convertedUI.producers, movieDetail.credits?.crew.filter({ $0.job.lowercased() == "producer" }))
        XCTAssertEqual(convertedUI.editor, movieDetail.credits?.crew.filter({ $0.job.lowercased() == "editor" }))
        XCTAssertEqual(convertedUI.story, movieDetail.credits?.crew.filter({ $0.job.lowercased() == "story" }))
        XCTAssertEqual(convertedUI.youtubeTrailers, movieDetail.videos?.results.filter({ $0.youtubeURL != nil }))
        
    }
    
}
