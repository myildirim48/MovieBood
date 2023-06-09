//
//  MovieBoodTabView.swift
//  MovieBood
//
//  Created by YILDIRIM on 31.03.2023.
//

import SwiftUI
struct MovieBoodTabView: View {
    var body: some View {
        TabView {
            MovieListView()
                .tabItem { Label("Home", systemImage: "film") }
                
            SearchView()
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
            WatchListView()
                .tabItem { Label("Watch List", systemImage: "list.bullet") }
        }
        .preferredColorScheme(.dark)
        .toolbarBackground(.black, for: .tabBar)
                
    }
}

struct MovieBoodTabView_Previews: PreviewProvider {
    static var previews: some View {
        MovieBoodTabView()
    }
}
