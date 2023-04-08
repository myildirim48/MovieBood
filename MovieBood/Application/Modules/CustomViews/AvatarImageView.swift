//
//  AvatarImageView.swift
//  MovieBood
//
//  Created by YILDIRIM on 6.04.2023.
//

import SwiftUI

struct AvatarImageView: View {
    
    var size: CGFloat = 56
    var name: String?
    var imgUrl: String?
//    /hz9AOUWZ2zzS0dpPJ1yQv2grA35.jpg
    // "No Url At Avatar ImageView"
    var body: some View {
        VStack{
            LoadableImage(url: URL(string: AppConfig.imageURL + (imgUrl ?? "AvatarImageView")), defaultImage: .avatar)
                     .scaledToFill()
                     .frame(width: size, height: size)
                      
            if name == "" || name == nil {
           }else{
                   Text(name!)
                   .foregroundColor(.white)
                   .lineLimit(1)
                   .minimumScaleFactor(0.75)
                   .frame(maxWidth: size + size/2)
           }
        }
    }
}

struct AvatarImageView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarImageView(size:75, name: "Master Yoda", imgUrl: "/hz9AOUWZ2zzS0dpPJ1yQv2grA35.jpg")
        
    }
}
