//
//  PersonDetailViewModel.swift
//  MovieBood
//
//  Created by YILDIRIM on 9.04.2023.
//

import Foundation
import Resolver

extension PersonDetailView {
    @MainActor class PersonDetailViewModel: ObservableObject {
        
        @Injected private var repository: MovieDetailRepositoryProtocol
        
        @Published public var person: PersonUIModel?
        @Published public var credits: PersonMovieCreditsUIModel?
        //        @Published var showError = false
        //        @Published var errorMessage: String?
        
        func fetchPerson(personID: Int) async {
            do {
                let response = try await repository.getPerson(personID: String(personID))
                self.person = response
            } catch {
                //                showError = true
                //                errorMessage = error.localizedDescription + "\nPlease contact the developer and provide this error and the steps to reproduce."
            }
        }
        
        func getCredits(personID: Int) async {
            do {
                let response = try await repository.getPersonCredits(personID: String(personID))
                self.credits = response
            } catch {
                //                showError = true
                //                errorMessage = error.localizedDescription + "\nPlease contact the developer and provide this error and the steps to reproduce."
            }
        }
    }
}
