//
//  ReviewCell.swift
//  MovieBood
//
//  Created by YILDIRIM on 6.04.2023.
//

import SwiftUI

struct ReviewCell: View {
    
    @Binding var reviews: [MovieReviewsUIModel]
    @Binding var lastSeenReview: MovieReviewsUIModel?
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(reviews) { review in
            ZStack (alignment: .leading) {
                NameBackgroundView()
                VStack{
                    HStack {
                        AvatarImageView(size: 40, imgUrl: review.authorDetails?.avatarPath)
                        VStack(alignment: .leading) {
                            Text(review.author ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 13,weight: .bold))
                                .lineLimit(1)
                                .minimumScaleFactor(0.75)
                            
                            HStack {
                                Text("\(review.ratingTextUI)")
                                    .foregroundColor(.yellow)
                                    .font(.system(size: 13))
                                
                                Text("\(String(review.authorDetails?.rating ?? 0)) / 10")
                                    .font(.system(size: 13,weight: .light))
                            }

                        
                        }
                    }
                    .padding(.leading, 30)
                    .padding(.top, 10)
                    .frame(width: 250.0, height: 50,alignment: .leading)
                    
                    Text(review.content ?? "")
                        .font(.caption)
                        .foregroundColor(Color.white)
                        .lineLimit(5)
                        .padding(.leading, 40.0)
                        .frame(width: 280.0, height: 100.0)
                    
                    Text(review.createdAt?.transformStringToDate().dateToString() ?? "")
                        .foregroundColor(.dateTextColor)
                        .font(.system(size: 12,weight: .medium))
                        .frame(width: 270.0 , alignment: .trailing)
                        .padding(.bottom,5)
                }
            }.onAppear{
                lastSeenReview = review
            }
                    
                }
            }
        }
        
    }
}

//struct ReviewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewCell(reviews: MovieReviewsUIModel.mockArr, lastSeenReview: MovieReviewsUIModel.mock)
//    }
//}


struct NameBackgroundView: View {
    var body: some View {
        Color(UIColor(.reviewBackground))
            .frame(width: 305, height: 188)
            .cornerRadius(12)
            .padding(.horizontal)
    }
}
