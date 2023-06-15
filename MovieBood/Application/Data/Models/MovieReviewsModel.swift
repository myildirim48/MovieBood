//
//  MovieReviewsModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 8.04.2023.
//

import Foundation
struct MovieReviewsModel: Codable, MockableModel {
    let author: String?
    let authorDetails: AuthorDetails?
    let content, id: String?
    let createdAt: String?

    static var mock: MovieReviewsModel {
        return MovieReviewsModel(author: "Author", authorDetails: AuthorDetails.mock, content: "This is niceeMovieee maaan", id: "1234321", createdAt: "11/10/2022")
    }
}

// MARK: - AuthorDetails

struct AuthorDetails: Codable, MockableModel,Equatable {
    let name, username: String?
    let avatarPath: String?
    let rating: Int?
    
    static var mock: AuthorDetails {
        return AuthorDetails(name: "Cuguli", username: "thisIsMee", avatarPath: "/asdfasd.png", rating: 8)
    }

}
