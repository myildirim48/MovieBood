//
//  MovieDetailView.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import SwiftUI

struct MovieDetailView: View {
    
    @ObservedObject private var viewModel = MovieDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack{
                VStack{
                   
                    //MARK: -  Top Poster
                    ZStack {
                        LoadableImage(url: URL(string: viewModel.movie.imgUrl), defaultImage: .movie)
                            .shadow(color: .init(white: 1.0, opacity: 0.5), radius: 10)
                            .frame(width: 459, height: 600)
                    }.padding(.bottom,-50)
                    
                    LinearGradient(gradient: Gradient(colors: [.clear, .black,.black]), startPoint: .top, endPoint: .bottom)
                        .frame(height: 90)
                    
                }.padding(.bottom,-50)

                //MARK: -  Middle Info
                VStack(alignment: .leading ,spacing: 30) {
                    DetailInfoView(movie: viewModel.movie)
                    
                    StrokeLine()
                    
                    AvatarListView(section: .directors, movie: viewModel.team[.directors] ?? [] )
                    
                        .padding(.bottom,40)
                    
                    AvatarListView(section: .producers, movie: viewModel.team[.producers] ?? [])
                    
                    StrokeLine()
                    
                    //MARK: - Bottom Reviews
                    VStack(alignment: .leading) {
                        InfoView(infoType:"Ratings & Reviews" , size: 24)
                        
                        VStack(alignment: .trailing) {
                            Text("4.8")
                                .foregroundColor(.lineStroke)
                                .font(.system(size: 44,weight: .bold))
                                
                            
                            Text("out of 5")
                                .foregroundColor(.lineStroke)
                                .font(.system(size: 15,weight: .bold))
                                
                        }
                        
                        ScrollView(.horizontal,showsIndicators: false){
            
                            LazyHStack(spacing: 12) {
                                ForEach(1..<8){ _ in
                                    ReviewCell()
                                    
                                }
                                
                            }
                        }
                    }.padding(.leading,5)
                    
                    
                }.padding(.leading,45)
                
                
            }
            
        }
        .background(.black)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
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
    
    var section : CrewType
    var movie: [MovieCrew]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(section.title)
                .foregroundColor(.white)
                .font(.system(size: 20))
                .fontWeight(.semibold)
            
            ScrollView(.horizontal,showsIndicators: false){
                
                LazyHStack(spacing: 12) {
                    ForEach(movie) { movie in
                        AvatarImageView(size: 76, name: "A. Skywalker", imgUrl: movie.profilePath)
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
        }
        
    }
}

struct DetailInfoView: View {
    var movie: MovieDetailUIModel
    var body: some View {
        VStack(alignment: .leading){
            Text(movie.title ?? "")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 250,height: 30,alignment: .leading)
                .padding(.bottom,20)
            
            
            VStack(alignment: .leading,spacing: 50) {
                HStack(spacing: 170) {
                    InfoView(infoType: "Duration", value: movie.runtimeUI, size: 18)
                    
                    InfoView(infoType: "Language", value: movie.originalLanguageUI, size: 18)
                }
                
                HStack(spacing: 215){
                    InfoView(infoType: "Genre", value: movie.genresUI, size: 18)
                    InfoView(infoType: "Age", value: "+15", size: 18)
                    
                }
                
                VStack(alignment: .leading,spacing: 30) {
                    
                    
                    InfoView(infoType: "Stroy", value: movie.overview, size: 20)
                    
                    
                    
                    InfoView(infoType: "IMDb Rating", value: "\(movie.voteAvarageUI) / 10", size: 24)
                }
            }
        }
        
        
        
        
        
        
        .padding(.trailing, 40)
    }
}
