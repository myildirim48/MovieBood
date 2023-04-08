//
//  PersonDetailView.swift
//  MovieBood
//
//  Created by YILDIRIM on 7.04.2023.
//

import SwiftUI

struct PersonDetailView: View {
    var movie : MovieCrew
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    LoadableImage(url: URL(string: AppConfig.imageURL + (movie.profilePath ?? "")), defaultImage: .movie)
                        .aspectRatio(contentMode: .fit)
                        .shadow(color: .init(white: 0.5, opacity: 0.5), radius: 10)
                        .frame(width: 350, height: 350)
                }.padding(.bottom,-50)
            }
        }
        .background(.black)
        .navigationTitle(movie.name)

    }
}

struct PersonDetailView_Preview: PreviewProvider {
    static var previews: some View {
        PersonDetailView(movie: .init(id: 1, job: "Mock", name: "MockName", profilePath: "NoImage"))
    }
}
