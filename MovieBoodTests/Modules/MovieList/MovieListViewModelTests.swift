//
//  MovieListViewModelTests.swift
//  MovieBoodTests
//
//  Created by YILDIRIM on 15.06.2023.
//

import XCTest
@testable import MovieBood
import Resolver

class MovieListViewModelTests: XCTestCase {
    
    var sut: MovieListView.MovieListViewModel!
    
    override func setUpWithError() throws {
        Resolver.setUp()
    }
    
    override func tearDownWithError() throws {
        Resolver.tearDown()
        sut = nil
    }
    
    @MainActor
    func testResultsAreEmpty() async throws {
        //        Given
        let givenResponse = MovieDetailModel.mock
        Resolver.test.register { MockBaseService(model: givenResponse) as BaseServiceProtocol }
        Resolver.test.register { MoviesRemoteService() as MoviesRemoteServiceProtocol }
        Resolver.test.register { MoviesRepository() as MoviesRepositoryProtocol }
        
        sut = .init()
        //        When
//        let results = sut.
        
        //        Then
    }
    
}
