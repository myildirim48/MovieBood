//
//  PersonModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 9.04.2023.
//

import Foundation
struct PersonModel: Codable {
    let biography, birthday: String?
    let deathday: String?
    let gender: Int?
    let homepage: String?
    let id: Int?
    let knownForDepartment, name, placeOfBirth: String?
    let profilePath: String?
}
