//
//  WatchListView.swift
//  MovieBood
//
//  Created by YILDIRIM on 31.03.2023.
//

import SwiftUI
import RealmSwift

struct WatchListView: View {
    @ObservedResults(FavoriteModel.self) var favorites
    @State private var movieName : String = ""
    @State private var searchFilter = ""
    
    var body: some View {
        NavigationView {
            
            if favorites.count > 0 {
                VStack {
                    List {
                        ForEach(favorites) { favorite in
                            NavigationLink {
                                MovieDetailView(movieID: favorite.movieID)
                            } label: {
                                MovieListRow(name: favorite.name, url: favorite.posterPath, releaseData: favorite.releaseDate)

                            }
                        }.onDelete(perform: $favorites.remove)
                    }
                    .listStyle(.plain)
                    .listRowSeparator(.hidden)
                    .searchable(text: $searchFilter,
                                collection: $favorites,
                                keyPath: \.name) {
                        ForEach(favorites) { favorite in
                           HStack(spacing: 10) {
                               MovieListRow(name: favorite.name, url: favorite.posterPath, releaseData: favorite.releaseDate)
                            }
                            .foregroundColor(.white)
                                .searchCompletion(favorite.name)
                        }
                    }
                }
                .navigationTitle("Watch List")
            }else {
                EmptyState()
            }

        }
        .badge(favorites.count)
        .onAppear(perform: {
            print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                        UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
        })
    }
}
struct WatchListView_Previews: PreviewProvider {
            static var previews: some View {
                WatchListView()
            }
        }
