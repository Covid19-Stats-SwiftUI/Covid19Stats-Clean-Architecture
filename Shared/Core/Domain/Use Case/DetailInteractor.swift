//
//  DetailInteractor.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 06/12/20.
//

import Foundation
import Combine

protocol DetailUseCase {
  
  func getStatsByCountry() -> AnyPublisher<GlobalCaseStatsModel, Covid19APIError>
  func getCountry() -> CountryModel
  
}

class DetailInteractor: DetailUseCase {
  
  private let repository: CovidRepositoryProtocol
  private let country: CountryModel
  
  required init(repository: CovidRepositoryProtocol, country: CountryModel) {
    self.repository = repository
    self.country = country
  }
  
  func getStatsByCountry() -> AnyPublisher<GlobalCaseStatsModel, Covid19APIError> {
    return repository.getStatsByCountry(country: country.name)
  }
  
  func getCountry() -> CountryModel {
    return country
  }
  
}
