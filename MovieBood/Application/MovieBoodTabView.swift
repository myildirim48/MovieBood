//
//  MovieBoodTabView.swift
//  MovieBood
//
//  Created by YILDIRIM on 31.03.2023.
//

import SwiftUI
import RealmSwift

struct MovieBoodTabView: View {
    @ObservedResults(FavoriteModel.self) var favorites
    var body: some View {
        TabView {
            MovieListView()
                .tabItem { Label("Home", systemImage: "film") }
                .preferredColorScheme(.dark)
            SearchView()
                .tabItem { Label("Search", systemImage: "magnifyingglass")
                }
                
            WatchListView()
                .tabItem { Label("Watch List", systemImage: "list.bullet") }
                .badge(favorites.count)
        }
        .toolbarBackground(.black, for: .tabBar)
                
    }
}

struct MovieBoodTabView_Previews: PreviewProvider {
    static var previews: some View {
        MovieBoodTabView()
    }
}
