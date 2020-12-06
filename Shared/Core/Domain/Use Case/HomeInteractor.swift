//
//  HomeInteractor.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation
import Combine

protocol HomeUseCase {
  
  func getGlobalCaseStats() -> AnyPublisher<GlobalCaseStatsModel, Covid19APIError>
  func getCountryCaseStatsConfirmed(by caseType: Endpoints.CaseType) -> AnyPublisher<[CountryCaseStatsModel], Covid19APIError>
  func getCountryCaseStatsRecovered(by caseType: Endpoints.CaseType) -> AnyPublisher<[CountryCaseStatsModel], Covid19APIError>
  func getCountryCaseStatsDeath(by caseType: Endpoints.CaseType) -> AnyPublisher<[CountryCaseStatsModel], Covid19APIError>
  func getCountries() -> AnyPublisher<[CountryModel], Covid19APIError>
  
}

class HomeInteractor: HomeUseCase {
  
  private let repository: CovidRepositoryProtocol
  
  required init(repository: CovidRepositoryProtocol) {
    self.repository = repository
  }
  
  func getGlobalCaseStats() -> AnyPublisher<GlobalCaseStatsModel, Covid19APIError> {
    return repository.getGlobalCaseStats()
  }
  
  func getCountryCaseStatsConfirmed(by caseType: Endpoints.CaseType) -> AnyPublisher<[CountryCaseStatsModel], Covid19APIError> {
    return repository.getCountryCaseStatsConfirmed(by: .confirmed)
  }
  
  func getCountryCaseStatsRecovered(by caseType: Endpoints.CaseType) -> AnyPublisher<[CountryCaseStatsModel], Covid19APIError> {
    return repository.getCountryCaseStatsRecovered(by: .recovered)
  }
  
  func getCountryCaseStatsDeath(by caseType: Endpoints.CaseType) -> AnyPublisher<[CountryCaseStatsModel], Covid19APIError> {
    return repository.getCountryCaseStatsDeath(by: .deaths)
  }
  
  func getCountries() -> AnyPublisher<[CountryModel], Covid19APIError> {
    return repository.getCountries()
  }
  
}
