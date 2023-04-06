//
//  ReviewCell.swift
//  MovieBood
//
//  Created by YILDIRIM on 6.04.2023.
//

import SwiftUI

struct ReviewCell: View {
    var body: some View {
        ZStack (alignment: .leading) {
            NameBackgroundView()
            VStack{
                HStack {
                    AvatarImageView(size: 40)
                    VStack(alignment: .leading) {
                        Text("Name")
                            .foregroundColor(.white)
                            .font(.system(size: 13,weight: .bold))
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                        Text("★★★★")
                            .foregroundColor(.yellow)
                            .font(.system(size: 13,weight: .bold))
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                    }
                }
                .padding(.leading, 30)
                .padding(.top, 10)
                .frame(width: 250.0, height: 50,alignment: .leading)
                
                Text("This is an engagingly simple, good-hearted film, with just enough darkness around the edges to give contrast and relief to its glowingly benign view of human nature.")
                    .font(.caption)
                    .foregroundColor(Color.white)
                    .lineLimit(nil)
                    .padding(.leading, 40.0)
                    .frame(width: 280.0, height: 100.0)
                
                Text("Tuesday")
                    .foregroundColor(.dateTextColor)
                    .font(.system(size: 12,weight: .medium))
                    .frame(width: 270.0 , alignment: .trailing)
                    .padding(.bottom,5)
                
                
                
            }
        }
    }
}

struct ReviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCell()
    }
}


struct NameBackgroundView: View {
    var body: some View {
        Color(UIColor(.reviewBackground))
            .frame(width: 305, height: 188)
            .cornerRadius(12)
            .padding(.horizontal)
    }
}
