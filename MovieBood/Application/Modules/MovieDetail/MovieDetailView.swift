//
//  MovieDetailView.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import SwiftUI
import RealmSwift

struct MovieDetailView: View {
    
    let movieID: Int
    @ObservedObject private var viewModel = MovieDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack{
                VStack{
                    
                    //MARK: -  Top Poster
                    ZStack {
                        LoadableImage(url: URL(string: viewModel.movie.imgUrl), defaultImage: .movie)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 459, height: 600)
                    }.padding(.bottom,-50)
                    
                    LinearGradient(gradient: Gradient(colors: [.clear, .black,.black]), startPoint: .top, endPoint: .bottom)
                        .frame(height: 90)
                    
                }.padding(.bottom,-50)
                
                //MARK: -  Middle Info
                VStack(alignment: .leading){
                    DetailInfoView(movie: viewModel.movie)
                    
                    VStack(alignment: .leading){
                        StrokeLine()
                        
                        VideoView(youtubeURL: viewModel.movie.youtubeTrailers?.first?.youtubeURL!).frame(width: 320, height: 220)
                            .cornerRadius(12)
                            .padding(.horizontal, 35)
                        
                            .shadow(color: .init(white: 0.5,opacity: 0.4), radius: 10)
                        
                        StrokeLine()
                        AvatarListView(section: "Directors",
                                       movies: viewModel.movie.directors)
                        AvatarListView(section: "Producer",
                                       movies: viewModel.movie.producers)
                        AvatarListView(section: "Editor",
                                       movies: viewModel.movie.editor)
                        AvatarListView(section: "Story",
                                       movies: viewModel.movie.story)
                        AvatarListView(section: "Cast", movies: viewModel.movie.convert(from: viewModel.movie.cast))
                    }
                    
                    StrokeLine()
                    
                    //MARK: - Bottom Reviews
                    VStack(alignment: .leading ){
                        
                        
                        InfoView(infoType:"Ratings & Reviews" , size: 24)
                        
                        VStack(alignment: .trailing) {
                            Text(viewModel.movie.voteAvarageUI)
                                .foregroundColor(.lineStroke)
                                .font(.system(size: 44,weight: .bold))
                            Text("out of 10")
                                .foregroundColor(.lineStroke)
                                .font(.system(size: 15,weight: .bold))
                        }
                        ReviewCell(reviews: $viewModel.reviews, lastSeenReview: $viewModel.lastSeenReview)
                        
                    }.padding(.leading,5)
                }.padding(.leading, 45)
            }
        }.onAppear{
            viewModel.fetchDetails(movieID: movieID)
        }
        .background(.black)
        .navigationTitle(viewModel.movie.title ?? "")
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieID: 677179)
    }
}

struct InfoView: View {
    
    var infoType: String
    var value: String?
    var size: CGFloat
    
    var body: some View {
        VStack(alignment: .leading,spacing: 8) {
            Text(infoType)
                .foregroundColor(.white)
                .font(.system(size: size))
                .fontWeight(.semibold)
            
            if let value = value {
                Text(value)
                    .foregroundColor(.white)
                    .font(.system(size: size - 3))
                    .fontWeight(.medium)
            }
        }
    }
}

struct AvatarListView: View {
    
    var section : String
    var movies: [MovieCrew]?
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(section)
                .foregroundColor(.white)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .padding(.leading)
            
            ScrollView(.horizontal,showsIndicators: false){
                LazyHStack{
                    
                    ForEach(movies ?? [.init(id: 1, job: "asd", name: "asd", profilePath: "asd")]) { movie in
                        NavigationLink {
                            PersonDetailView(personID: movie.id)
                        } label: {
                            TabView {
                                AvatarImageView(size: 56, name: movie.name, imgUrl: movie.profilePath)
                                    .shadow(color: .init(white: 0.5, opacity: 0.3), radius: 10)
                            }.frame(height: 80)
                                .tabViewStyle(.page)
                        }
                    }
                    
                }
                
            }
        }
    }
}

struct StrokeLine: View {
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.lineStroke)
                .frame( height: 1)
                .padding(10)
                .padding(.bottom,30)
                .padding(.top,30)
        }
    }
}

struct DetailInfoView: View {
    
    @ObservedResults(FavoriteModel.self) var addFavorites
    
    var movie: MovieDetailUIModel
    var body: some View {
        VStack(alignment: .leading){
            
            VStack {
                HStack {
                    Text(movie.title ?? "")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 250,alignment: .leading)
                    Spacer()
                    Button {
                        let newFavorite = FavoriteModel(name: movie.title ?? "", movieID: movie.id, posterPath: movie.imgUrl)
                        $addFavorites.append(newFavorite)
                    } label: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFill()
                            
                    }
                    .frame(width: 32, height: 32)
                    .padding(.trailing,-10)
                    .foregroundColor(.red)
                    
                }
                
                Text(movie.tagline ?? "")
                    .foregroundColor(.white)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.bottom,20)
            }
            
            VStack(spacing: 50) {
                HStack{
                    VStack(alignment: .leading,spacing: 30) {
                        InfoView(infoType: "Duration", value: movie.runtimeUI, size: 18)
                        InfoView(infoType: "Genre", value: movie.genresUI, size: 18)
                    }
                    Spacer()
                    VStack(alignment: .leading,spacing: 30){
                        InfoView(infoType: "Language", value: movie.originalLanguageUI, size: 18)
                        InfoView(infoType: "Age", value: "+15", size: 18)
                    }
                }
                VStack(alignment: .leading, spacing: 30) {
                    InfoView(infoType: "Stroy", value: movie.overview, size: 20)
                    InfoView(infoType: "IMDb Rating", value: movie.voteAvarageUI, size: 24)
                }
            }
        }.padding()
            .padding(.trailing, 40)
    }
}
