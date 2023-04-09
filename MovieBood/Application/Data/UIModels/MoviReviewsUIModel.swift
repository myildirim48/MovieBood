//
//  MoviReviewsUIModel.swift
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

extension MovieReviewsUIModel: MockableModel {
    
    static var mockArr = [mock,mock,mock]
    
    static var mock: MovieReviewsUIModel {
        return MovieReviewsUIModel(author: "mooney240",
                                   authorDetails:
                                    AuthorDetails(name: "yildirim",
                                                  username: "Yildirim",
                                                  avatarPath: "/blEC280vq31MVaDcsWBXuGOsYnB.jpg", rating: 7),
                                   content: "**Avatar: The Way of Water follows in its predecessor’s footsteps with stunning effects and a mediocre story.** It’s a James Cameron film, so it’s impressive. The special effects, camerawork, world-building, and action were all off the charts. But Avatar: The Way of Water struggles like its predecessor in the story and character development departments. In fact, the story of The Way of Water is almost identical to the first Avatar. Instead of humans learning to be Na’vi and then fighting Stephen slang, a family of forest Na’vi learns to be ocean Na’vi and then fight Stephen Lang. But the new movie also focuses on a group of annoying teens that constantly get themselves in trouble and peril over and over again throughout the much too long 3+ hour runtime and sidelining better, more established characters. All the strengths and weaknesses of the first movie are back in this one, with the bonus of being compared to the original at every turn. It really is a visual feast and special effects masterpiece, but just like the first Avatar, that’s all it is.",
                                   id: "639c14af0752880093558e1c", createdAt: "30-03-2022")
    }
    
    static func convert(from reviewsModel: [MovieReviewsModel]) -> [MovieReviewsUIModel]  {
        return reviewsModel.map { review in
            return MovieReviewsUIModel(author: review.author, authorDetails: review.authorDetails, content: review.content, id: review.id, createdAt: review.createdAt)
        }
    }
}
