//
//  MovieReviewsUIModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 8.04.2023.
//

import Foundation
struct MovieReviewsUIModel:Equatable,Identifiable {
  
    let author: String?
    let authorDetails: AuthorDetails?
    let content, id: String?
    let createdAt: String?

    static func == (lhs: MovieReviewsUIModel, rhs: MovieReviewsUIModel) -> Bool {
        lhs.id == rhs.id
    }
    
    //Rating,ScoreO
    var ratingTextUI: String {
        let rating = Int(authorDetails?.rating ?? 0)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    
//
    
}

extension MovieReviewsUIModel {
        
    static func convert(from reviewsModel: [MovieReviewsModel]) -> [MovieReviewsUIModel]  {
        return reviewsModel.map { review in
            return MovieReviewsUIModel(author: review.author, authorDetails: review.authorDetails, content: review.content, id: review.id, createdAt: review.createdAt)
        }
    }
}
