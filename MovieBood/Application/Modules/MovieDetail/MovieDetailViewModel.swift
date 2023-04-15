//
//  MovieDetailViewModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 4.04.2023.
//

import Foundation
import Resolver
import SwiftUI
import Combine
import RealmSwift

extension MovieDetailView {
    
    @MainActor class MovieDetailViewModel: ObservableObject {
        
        @Injected private var repository: MovieDetailRepositoryProtocol
        
        @Published public var movie: MovieDetailUIModel = MovieDetailUIModel.mock
        @Published public var reviews: [MovieReviewsUIModel] = []
        @Published public var lastSeenReview: MovieReviewsUIModel?
        
        @Published public var hasRealm: Bool = false
//        @ObservedResults(FavoriteModel.self) var addFavorites

        
        private var pagesOfReviews: Int = 1
        private var canellabes = Set<AnyCancellable>()
            
        init(){
            $lastSeenReview.sink { _ in
            } receiveValue: { [weak self] review in
                guard let self else { return }
                guard let review else { return }
                if review == self.reviews.last && self.hasNextpage() {
                    self.pagesOfReviews += 1
                    self.fetchReviews(movieID: self.movie.id)
                }
            }.store(in: &canellabes)
        }
        
        func fetchDetails(movieID:Int){
            repository.getMvoeiDetail(movieID: String(movieID)) { result in
                switch result {
                case .success(let movie):
                    DispatchQueue.main.async {
                        self.movie = movie
                        self.fetchReviews(movieID: movieID)
                        self.checkRealm()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        func fetchReviews(movieID: Int){
            repository.getReviews(movieID: String(movieID), page: String(pagesOfReviews)) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let success):
                    DispatchQueue.main.async {
                        self.reviews = success.sorted(by: { $0.createdAt ?? "" > $1.createdAt ?? ""})
                    }
                    if self.hasNextpage() {
                        self.pagesOfReviews += 1
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
            
        }
        
        func hasNextpage() -> Bool {
            pagesOfReviews < repository.totalPagesofReviews ? true : false
        }
        
        //MARK: -  Realm
       private func checkRealm() {
            let realm = try! Realm()
            if realm.object(ofType: FavoriteModel.self, forPrimaryKey: movie.id) != nil {
                hasRealm = true
            } else {
                hasRealm = false
            }
        }
        
//        func addMovieToFavorites(title: String?, id:Int, imgUrl: String) {
//            do {
//                let realm = try! Realm()
//                guard let objectToUpdate = realm.object(ofType: FavoriteModel.self, forPrimaryKey: movie.id) else {
//                    let newFavorite = FavoriteModel(name: title ?? "", movieID: id, posterPath: imgUrl)
//                    $addFavorites.append(newFavorite)
//                    hasRealm = true
//                    return
//                }
//                try realm.write {
//                    realm.delete(objectToUpdate)
//                    hasRealm = false
//                }
//            }
//            catch {
//                print(error)
//            }
//        }
    }
}
