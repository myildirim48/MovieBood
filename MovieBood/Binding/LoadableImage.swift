//
//  LoadableImage.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import SwiftUI

struct LoadableImage: View {
        var url : URL?
        var widthPo : CGFloat?
        var heightPo : CGFloat?
        
        var body: some View {
            AsyncImage(url: url) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .shadow(radius: 4)
                        .frame(width: widthPo, height: heightPo)
                case .failure:
                    Image("PlaceholderImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                        .frame(width: 85, height: 85)
                case .empty:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
                        .scaleEffect(1.2)
                    
                @unknown default:
                    EmptyView()
                }
            }
        }
    
}

struct LoadableImage_Previews: PreviewProvider {
    static var previews: some View {
        LoadableImage()
    }
}
