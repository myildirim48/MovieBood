//
//  MovelistView.swift
//  MovieBood
//
//  Created by YILDIRIM on 31.03.2023.
//

import SwiftUI

struct MoveListView: View {
    
    @ObservedObject private var viewModel = MovieListViewModel()
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    NavigationLink {
                        MovieDetailView()
                    } label: {
                        ImageSlider(popularMovies: viewModel.movies[.popular] ?? [],height: 550,width: 450)
                    }
                    
                    HorizontalMovies(dataType: .nowPlaying,
                                     movies: viewModel.movies[.nowPlaying] ?? [] ,
                                     lastSeenMovie: $viewModel.lastNowPlayingMovie)
                    
                    HorizontalMovies(dataType: .topRated,
                                     movies: viewModel.movies[.topRated] ?? [],
                                     lastSeenMovie: $viewModel.lastNowPlayingMovie)
                    
                    HorizontalMovies(dataType: .upComing,
                                     movies: viewModel.movies[.upComing] ?? [],
                                     lastSeenMovie: $viewModel.lastNowPlayingMovie)
                }

                .onAppear {
                    viewModel.fetchMovies()
                    //TODO: - Pagination
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
        MoveListView()
    }
}

struct HorizontalMovies: View {
    var dataType: FetchedDataType
    var movies: [MovieResultUIModel]
    @Binding var lastSeenMovie: MovieResultUIModel?
    
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            
            Text(dataType.title)
                .font(.custom("PlayfairDisplay-Bold", size: 23))
                .padding(.horizontal)
                .foregroundColor(.white)
            //                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                LazyHStack(){
                    ForEach(movies) { movie in
                        NavigationLink(
                            destination: MovieDetailView(),
                            label: {
                                //
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
