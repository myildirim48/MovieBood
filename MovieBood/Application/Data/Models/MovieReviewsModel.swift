//
//  MovieReviewsModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 8.04.2023.
//

import Foundation
struct MovieReviewsModel: Codable {
    let author: String?
    let authorDetails: AuthorDetails?
    let content, id: String?
    let createdAt: String?

}

// MARK: - AuthorDetails

struct AuthorDetails: Codable {
    let name, username: String?
    let avatarPath: String?
    let rating: Int?

}
