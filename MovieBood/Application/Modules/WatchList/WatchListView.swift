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
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(){
                    ForEach(favorites) { favorite in
                        NavigationLink {
                            MovieDetailView(movieID: favorite.movieID)
                        } label: {
                            WatchListRow(watchList: favorite)
                        }
                    }
                    
                    
                    VStack{
                        VStack {
                            
                            List {
                                ForEach(favorites.sorted(by: [
                                    SortDescriptor(keyPath: "watched"),
                                    SortDescriptor(keyPath: "status", ascending: true)
                                ])) { favorite in
                                    NavigationLink {
                                        MovieDetailView(movieID: favorite.movieID)
                                    } label: {
                                        WatchListRow(watchList: favorite)
                                    }
                                    
                                }
                                .onDelete(perform: $favorites.remove)
                                .listRowSeparator(.hidden)
                                
                            }
                            .listStyle(.plain)
                            .searchable(text: $searchFilter,
                                        collection: $favorites,
                                        keyPath: \.name) {
                                ForEach(favorites) { favorite in
                                    Text(favorite.name)
                                        .searchCompletion(favorite.name)
                                }
                            }
                        }
                        .animation(.default, value: favorites)
                    }
                }
            }
            .navigationTitle("Watch List")
        }
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
