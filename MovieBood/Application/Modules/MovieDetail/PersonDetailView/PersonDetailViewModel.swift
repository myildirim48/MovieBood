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
        
        @Published public var person: PersonUIModel = PersonUIModel.mock
        
        func fetchPerson(personID: Int){
            repository.getPerson(personID: String(personID)) { result in
                switch result {
                case .success(let success):
                    DispatchQueue.main.async {
                        self.person = success
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}
