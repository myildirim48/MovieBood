//
//  MovelistView.swift
//  MovieBood
//
//  Created by YILDIRIM on 31.03.2023.
//

import SwiftUI

struct MovelistView: View {
    
    @StateObject private var viewModel = MovieListViewModel()
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    NavigationLink {
                        MovieDetailView()
                    } label: {
                        ImageSlider(popularMovies: viewModel.popularMovies)
                    }
                    HorizontalMovies(dataType: .nowPlaying, movies: viewModel.nowPlayingMovies)
                    HorizontalMovies(dataType: .upComing, movies: viewModel.upComingMovies)
                    HorizontalMovies(dataType: .topRated, movies: viewModel.topRatedMovies)
            
                    }.onAppear {
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
        MovelistView()
    }
}

struct HorizontalMovies: View {
    
    var dataType: FetchedDataType
    var movies: [MovieResultUIModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(dataType.title)
                .font(.custom("PlayfairDisplay-Bold", size: 25))
                .padding(.horizontal)
                .foregroundColor(.white)
                .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    
                    ForEach(movies) { movie in
                        NavigationLink(
                            destination: MovieDetailView(),
                            label: {
                                LoadableImage(url: URL(string: movie.returnImgURL), widthPo: 140, heightPo: 240 )
                                    .shadow(color: .init(white: 0.5,opacity: 0.3), radius: 10)
                                
                            })
                        .navigationBarHidden(true)
                        .foregroundColor(.black)
                    }
                    .padding(.leading)
                }
            }
        }
    }
}
