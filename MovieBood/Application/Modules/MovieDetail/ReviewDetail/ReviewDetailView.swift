//
//  ReviewDetailView.swift
//  MovieBood
//
//  Created by YILDIRIM on 15.04.2023.
//

import SwiftUI

struct ReviewDetailView: View {
    
    var review: MovieReviewsUIModel

    var body: some View {
        ScrollView {
            AvatarImageView(size: 150, name: review.author, imgUrl: review.authorDetails?.avatarPath)
                .padding(.top,50)
                
            HStack {
                Text("\(review.ratingTextUI)")
                    .foregroundColor(.yellow)
                    .font(.system(size: 15))
                
                Text("\(String(review.authorDetails?.rating ?? 0)) / 10")
                    .font(.system(size: 15,weight: .light))
            }
            Spacer()
            Text(review.content ?? "")
                .font(.body)
                .foregroundColor(Color.white)
                .padding(15)
        }
    }
}

struct ReviewDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewDetailView(review: MovieReviewsUIModel.convert(from: [MovieReviewsModel.mock]).first!)
    }
}
