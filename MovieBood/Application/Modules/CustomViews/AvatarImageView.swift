//
//  AvatarImageView.swift
//  MovieBood
//
//  Created by YILDIRIM on 6.04.2023.
//

import SwiftUI

struct AvatarImageView: View {
    
    var size: CGFloat
    var name: String?
    
    var body: some View {
       VStack {
            Image("default-avatar")
                .resizable()
                .scaledToFill()
                .frame(width: size,height: size)
                .background(Color.white)
                .clipShape(Circle())
           
           if name == "" || name == nil {
               
           }else{
               Text(name!)
               .foregroundColor(.white)
               .lineLimit(1)
               .minimumScaleFactor(0.75)
               .frame(maxWidth: size)
           }

        }

                
        

    }
}

struct AvatarImageView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarImageView(size: 90, name: "Master Yoda")
        
    }
}
