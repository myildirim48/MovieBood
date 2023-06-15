//
//  MoviesUIModelConverterTests.swift
//  MovieBoodTests
//
//  Created by YILDIRIM on 14.06.2023.
//

import XCTest
@testable import MovieBood

final class MoviesUIModelConverterTests: XCTestCase {

    var sut = MoviesUIModel.self

    func testUIModelConvertedCorrectly() throws {
        //        Given
        let moviesResponse = MoviesModel.mock
        //        When
        let convertedUIModel = try XCTUnwrap(sut.convert(from: [moviesResponse], dataType: .nowPlaying).first)

        //        Then
        XCTAssertEqual(convertedUIModel.movieID, moviesResponse.id)
        XCTAssertEqual(convertedUIModel.posterPath, moviesResponse.posterPath)
        XCTAssertEqual(convertedUIModel.fetchedDataType, .nowPlaying)
    }
}
