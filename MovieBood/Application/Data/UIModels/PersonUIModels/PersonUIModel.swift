//
//  PersonUIModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 9.04.2023.
//

import Foundation
struct PersonUIModel: Equatable {
    
    let biography: String?
    private let birthday: String?
    let gender: Int?
    let homepage: String?
    let id: Int?
    let knownForDepartment, name, placeOfBirth: String?
    private let profilePath: String?
    
    static func == (lhs:PersonUIModel, rhs: PersonUIModel) -> Bool {
        lhs.id == rhs.id
    }
    
    var birthdayUI: String {
        birthday?.transformStringToDate().dateToString() ?? "n / a"
    }
    
    var profileImageUI: URL {
        return URL(string: AppConfig.imageURL + (profilePath ?? "emptyImage"))!
    }
    
    static func convert(from response: PersonModel) -> PersonUIModel {
        return PersonUIModel(biography: response.biography, birthday: response.birthday, gender: response.gender, homepage: response.homepage, id: response.id, knownForDepartment: response.knownForDepartment, name: response.name, placeOfBirth: response.placeOfBirth, profilePath: response.profilePath)
    }
}


