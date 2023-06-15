//
//  PersonModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 9.04.2023.
//

import Foundation
struct PersonModel: Codable, MockableModel {
    let biography, birthday: String?
    let gender: Int?
    let homepage: String?
    let id: Int?
    let knownForDepartment, name, placeOfBirth: String?
    let profilePath: String?
    
    static var mock: PersonModel {
        return PersonModel(biography: "Born in 1965.", birthday: "2023-05-17", gender: 0, homepage: "", id: 123, knownForDepartment: "Acting", name: "John Cena", placeOfBirth: "West Virginia", profilePath: "profilePath")
    }
}
