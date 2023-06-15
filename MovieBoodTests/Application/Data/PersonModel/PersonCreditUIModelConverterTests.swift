//
//  PersonCreditUIModelConverterTests.swift
//  MovieBoodTests
//
//  Created by YILDIRIM on 15.06.2023.
//

import XCTest
@testable import MovieBood
final class PersonCreditUIModelConverterTests: XCTestCase {
    var sut = PersonMovieCreditsUIModel.self
    
    func testPersonMovieCreditsToUIModelConvertedCorrectly() throws {
        //        Given
        let personMovie = PersonMovieCredits.mock
        //        When
        let convertedModel = try XCTUnwrap(sut.convert(from:personMovie))
        //        Then
        XCTAssertEqual(convertedModel.id, personMovie.id)
        XCTAssertEqual(convertedModel.movies, (personMovie.cast + personMovie.crew))
    }
 
}
