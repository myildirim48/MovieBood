//
//  MovieSearchUIModelConverterTests.swift
//  MovieBoodTests
//
//  Created by YILDIRIM on 15.06.2023.
//

import XCTest
@testable import MovieBood
final class MovieSearchUIModelConverterTests: XCTestCase {

    var sut = MovieSearchUIModel.self
    
    func testMovieSearchConvertToUIModelCorrectly() throws {
        //        Given
        let movieSearch = MovieSearchModel.mock
        //        When
        let convertedUI = try XCTUnwrap(sut.convert(from:[movieSearch]).first)
        //        Then
        XCTAssertEqual(convertedUI.dateUI, movieSearch.releaseDate?.transformStringToDate().dateToString())
        XCTAssertEqual(convertedUI.id, movieSearch.id)
        XCTAssertEqual(convertedUI.imgUrl, AppConfig.imageURL + movieSearch.posterPath!)
        XCTAssertEqual(convertedUI.titleUI, movieSearch.title)
    }

}
