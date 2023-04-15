//
//  WatchListRow.swift
//  MovieBood
//
//  Created by YILDIRIM on 11.04.2023.
//

import SwiftUI

struct MovieListCell: View {
    var name: String
    var url: String
    var releaseData: String
    
    var body: some View {
        HStack {
            TabView {
                LoadableImage(url: URL(string: url), defaultImage: .movie)
                    .shadow(color: .init(white: 0.5,opacity: 0.3), radius: 10)
            }                    .frame(width: 140, height: 180)
            .tabViewStyle(.page)
            
            VStack(alignment: .leading,spacing: 15) {
                Text(name)
                    .foregroundColor(.white)
                    .font(.system(size: 18,weight: .semibold))
                Text(releaseData)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .semibold))
            }.padding(.top,-35)
        }
    }
}

struct WatchListRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieListCell(name: "Movie Name", url: "", releaseData: "30.03.2022")
    }
}
