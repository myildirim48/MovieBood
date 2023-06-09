//
//  ImageSlider.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import SwiftUI

struct ImageSlider: View {
    
    var popularMovies: [MoviesUIModel]

    var body: some View {
        
        TabView {
            ForEach(popularMovies) { movie in
                NavigationLink {
                    MovieDetailView(movieID: movie.movieID)
                } label: {
                    LoadableImage(url: URL(string: movie.returnImgURL), defaultImage: .movie)
                }
                }
        }
        .shadow(color: .init(white: 0.5,opacity: 0.3), radius: 20)
        .frame(height: 550)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .onAppear(perform: {
            UIPageControl.appearance().currentPageIndicatorTintColor = .systemYellow
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.yellow.withAlphaComponent(0.2)
        })
        
    }
    
}

struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlider(popularMovies: MoviesUIModel.convert(from: [MoviesModel.mock], dataType: .nowPlaying))
    }
}

