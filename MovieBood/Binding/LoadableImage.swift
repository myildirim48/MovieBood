//
//  LoadableImage.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import SwiftUI

enum EmtypImage: String {
    case movie
    case avatar
    
    var name: String {
        switch self {
        case .movie:
            return "default-movie"
        case .avatar:
            return "default-avatar"
        }
    }
}

struct LoadableImage: View {
        var url : URL?
        var defaultImage: EmtypImage
        
        var body: some View {
            
            AsyncImage(url: url,transaction: .init()) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        
                    
                case .failure:
                    Image(defaultImage.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .frame(width: 85, height: 85)
                    Text("Image not found...")
                        .foregroundColor(.secondary)
                        .font(.system(size: 14,weight: .semibold))
                        .padding()
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
        LoadableImage( defaultImage: .avatar)
    }
}
