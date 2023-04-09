//
//  PersonUIModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 9.04.2023.
//

import Foundation
struct PersonUIModel: Equatable,MockableModel {
    
    let biography, birthday: String?
    let deathday: String?
    let gender: Int?
    let homepage: String?
    let id: Int?
    let knownForDepartment, name, placeOfBirth: String?
    let profilePath: String?
    
    static func == (lhs:PersonUIModel, rhs: PersonUIModel) -> Bool {
        lhs.id == rhs.id
    }
    
    var birthdayUI: String {
        birthday?.transformStringToDate().dateToString() ?? "n / a"
    }
    
    var deathdayUI: String {
        deathday?.transformStringToDate().dateToString() ?? "n / a"
    }
    
    var ptofileImageUI: URL {
        URL(string: AppConfig.imageURL + (profilePath ?? "n / a"))!
    }
    
    static func convert(from response: PersonModel) -> PersonUIModel {
        return PersonUIModel(biography: response.biography, birthday: response.birthday, deathday: response.deathday, gender: response.gender, homepage: response.homepage, id: response.id, knownForDepartment: response.knownForDepartment, name: response.name, placeOfBirth: response.placeOfBirth, profilePath: response.profilePath)
    }
    
    static var mock: Self {
        return PersonUIModel(biography: "Sylvester Stallone (born Michael Sylvester Gardenzio Stallone, July 6, 1946) is an American actor and filmmaker. After his beginnings as a struggling actor for a number of years upon arriving to New York City in 1969 and later Hollywood in 1974, he won his first critical acclaim as an actor for his co-starring role as Stanley Rosiello in The Lords of Flatbush.", birthday: "1946-07-06", deathday: "", gender: 2, homepage: "http://www.sylvesterstallone.com", id: 16483, knownForDepartment: "Acting", name: " Sylvester Stallone", placeOfBirth: "New York City, New York, USA", profilePath: "/qDRGPAcQoW8Wuig9bvoLpHwf1gU.jpg")
    }
    
}


