//
//  SearchInteractor.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import Foundation
import Combine

protocol SearchUseCase {
  
  func getCountries() -> AnyPublisher<[CountryModel], Covid19APIError>
  
}

class SearchInteractor: SearchUseCase {
  
  private let repository: CovidRepositoryProtocol
  
  required init(repository: CovidRepositoryProtocol) {
    self.repository = repository
  }
  
  func getCountries() -> AnyPublisher<[CountryModel], Covid19APIError> {
    return repository.getCountries()
  }
  
}
