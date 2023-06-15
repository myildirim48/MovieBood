//
//  PersonUIModelConverterTests.swift
//  MovieBoodTests
//
//  Created by YILDIRIM on 15.06.2023.
//

import XCTest
@testable import MovieBood
final class PersonUIModelConverterTests: XCTestCase {
    
    
    var sut = PersonUIModel.self
    
    func testPersonModelToUIConvertCorrectly() throws {
        //        Given
        let personModel = PersonModel.mock
        //        When
        let convertedModel = try XCTUnwrap(sut.convert(from:personModel))
        //        Then
        XCTAssertEqual(convertedModel.biography, personModel.biography)
        XCTAssertEqual(convertedModel.birthdayUI, personModel.birthday?.transformStringToDate().dateToString())
        XCTAssertEqual(convertedModel.gender, personModel.gender)
        XCTAssertEqual(convertedModel.homepage, personModel.homepage)
        XCTAssertEqual(convertedModel.knownForDepartment, personModel.knownForDepartment)
        XCTAssertEqual(convertedModel.name, personModel.name)
        XCTAssertEqual(convertedModel.placeOfBirth, personModel.placeOfBirth)
        XCTAssertEqual(convertedModel.profileImageUI, URL(string: AppConfig.imageURL + personModel.profilePath!)!)
    }
    

}
