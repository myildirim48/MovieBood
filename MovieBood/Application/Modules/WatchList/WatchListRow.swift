//
//  WatchListRow.swift
//  MovieBood
//
//  Created by YILDIRIM on 11.04.2023.
//

import SwiftUI
import RealmSwift

struct WatchListRow: View {
    @ObservedRealmObject var watchList: FavoriteModel
    var body: some View {
    
        TabView {
            LoadableImage(url: URL(string: watchList.posterPath), defaultImage: .movie)
                .shadow(color: .init(white: 0.5,opacity: 0.3), radius: 10)
            
        }.frame(width: 140, height: 180)
            .tabViewStyle(.page)
        
        VStack(alignment: .leading) {
            Text(watchList.name)
            
            Button {
                $watchList.status.wrappedValue = watchList.increment()
            } label: {
                Text(watchList.status.text)
                    .font(.system(size: 10, weight: .thin, design: .monospaced))
                    .padding(5)
                    .foregroundColor(Color(.systemBackground))
                    .background(RoundedRectangle(cornerRadius: 10).fill(watchList.status.color))
                //                        .frame(width: 120, height: 50)
            }
        }
        Spacer()
        Button {
            //                $watchList.remove
        } label: {
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFill()
            
        }
        .frame(width: 28, height: 32)
        .padding(.trailing, 20)
        .foregroundColor(.red)
        
        
        
        Button {
            $watchList.watched.wrappedValue.toggle()
        } label: {
            Image(systemName: watchList.watched ? "checkmark.circle" : "circle")
                .padding()
            
        }
        
    }
}

struct WatchListRow_Previews: PreviewProvider {
    static var previews: some View {
        WatchListRow(watchList: FavoriteModel(name: "Creed III", movieID: 677179, posterPath: "/5i6SjyDbDWqyun8klUuCxrlFbyw.jpg"))
    }
}
