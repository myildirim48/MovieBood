//
//  MovieReviewsUIModelConverterTests.swift
//  MovieBoodTests
//
//  Created by YILDIRIM on 14.06.2023.
//

import XCTest
@testable import MovieBood

final class MovieReviewsUIModelConverterTests: XCTestCase {

    var sut = MovieReviewsUIModel.self
    
    func testMovieReviewsConvertToUIModelCorrectly() throws {
        //        Given
        let movieReviews = MovieReviewsModel.mock
        //        When
        let convertedUI = try XCTUnwrap(sut.convert(from:[movieReviews]).first)
        //        Then
        XCTAssertEqual(convertedUI.author, movieReviews.author)
        XCTAssertEqual(convertedUI.authorDetails, movieReviews.authorDetails)
        XCTAssertEqual(convertedUI.content, movieReviews.content)
        XCTAssertEqual(convertedUI.createdAt, movieReviews.createdAt)
        XCTAssertEqual(convertedUI.id, movieReviews.id)
        XCTAssertEqual(convertedUI.ratingTextUI, "★★★★★★★★")
    }
    
}
