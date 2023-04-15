//
//  FavoriteModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 10.04.2023.
//

import SwiftUI
import RealmSwift

class FavoriteModel: Object,ObjectKeyIdentifiable {

    //    @Persisted(primaryKey: true) var id: ObjectId
    
    @Persisted var name: String
    @Persisted(primaryKey: true) var movieID: Int
//    @Persisted var favorited: Bool = true
    @Persisted var posterPath: String
    @Persisted var releaseDate: String
//    @Persisted var status: StatusWatched = .onlist

//    enum StatusWatched: Int,PersistableEnum{
//    case watched, onlist, rememberMeLater
//
//        var text: String{
//            switch self {
//            case .watched: return "Watched"
//            case .onlist: return "On list"
//            case .rememberMeLater: return "Remember me later"
//            }
//        }
//
//        var color: Color {
//            switch self {
//            case .watched:
//                return .teal
//            case .onlist:
//                return .secondary
//            case .rememberMeLater:
//                return .green
//            }
//        }
//    }
    
//    func increment() -> StatusWatched {
//        switch status {
//        case .watched:
//            return .onlist
//        case .onlist:
//            return .rememberMeLater
//        case .rememberMeLater:
//            return .watched
//        }
//    }
    
//    func isOnRealm(movieID: Int) -> Bool {
//        guard (realm?.object(ofType: FavoriteModel.self, forPrimaryKey: movieID)) != nil else  { return false }
//        return true
//    }
    
    convenience init(name: String, movieID: Int, posterPath: String?, releaseDate: String?) {
        self.init()
        self.name = name
        self.movieID = movieID
        self.posterPath = posterPath ?? ""
        self.releaseDate = releaseDate ?? ""
    }
}
