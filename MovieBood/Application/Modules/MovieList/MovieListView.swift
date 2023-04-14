//
//  MovelistView.swift
//  MovieBood
//
//  Created by YILDIRIM on 31.03.2023.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject private var viewModel = MovieListViewModel()
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    VStack {
                    ImageSlider(popularMovies: viewModel.movies[.popular] ?? [])
                }
                    HorizontalMovies(dataType: .nowPlaying,
                                     movies: $viewModel.movies[.nowPlaying],
                                     lastSeenMovie: $viewModel.lastNowPlayingMovie)
                    HorizontalMovies(dataType: .topRated,
                                     movies: $viewModel.movies[.topRated],
                                     lastSeenMovie: $viewModel.lastNowPlayingMovie)
                    HorizontalMovies(dataType: .upComing,
                                     movies: $viewModel.movies[.upComing],
                                     lastSeenMovie: $viewModel.lastNowPlayingMovie)
                }
                .onAppear {
                    viewModel.fetchMovies()
                }
            }
            .padding(.bottom, 30)
            .padding(.top, 10)
            .background(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}

struct HorizontalMovies: View {
    var dataType: FetchedDataType
    @Binding var movies: [MoviesUIModel]?
    @Binding var lastSeenMovie: MoviesUIModel?
    
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            
            Text(dataType.title)
                .font(.custom("PlayfairDisplay-Bold", size: 23))
                .padding(.horizontal)
                .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                LazyHStack(){
                    ForEach((movies ?? MoviesUIModel.mocModelArr)) { movie in
                        NavigationLink(
                            destination: MovieDetailView(movieID: movie.movieID),
                            label: {
                                TabView {
                                    LoadableImage(url: URL(string: movie.returnImgURL), defaultImage: .movie)
                                        .shadow(color: .init(white: 0.5,opacity: 0.3), radius: 10)
                                }.frame(width: 140, height: 250)
                                    .tabViewStyle(.page)
                            })
                        .onAppear{
                            lastSeenMovie = movie
                        }
                    }
                    .padding(.leading)
                }
            }
            
        }
        
    }
}
