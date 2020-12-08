//
//  CovidRepository.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation
import Combine

protocol CovidRepositoryProtocol {
  
  func getGlobalCaseStats() -> AnyPublisher<GlobalCaseStatsModel, Covid19APIError>
  func getCountries() -> AnyPublisher<[CountryModel], Covid19APIError>
  func getStatsByCountry(country name: String) -> AnyPublisher<GlobalCaseStatsModel, Covid19APIError>
  func getCountryCaseStats(by caseType: CovidEndpoints.CaseType) -> AnyPublisher<[CountryCaseStatsModel], Covid19APIError>
  
}

final class CovidRepository: NSObject {
  
  typealias CovidInstance = (CovidNetworkDataSource) -> CovidRepository
  
  fileprivate let remote: CovidNetworkDataSource
  
  private init(remote: CovidNetworkDataSource) {
    self.remote = remote
  }
  
  static let sharedInstance: CovidInstance = { remoteRepo in
    return CovidRepository(remote: remoteRepo)
  }
  
}

extension CovidRepository: CovidRepositoryProtocol {
  func getGlobalCaseStats() -> AnyPublisher<GlobalCaseStatsModel, Covid19APIError> {
    self.remote.getGlobalCaseStats()
      .map { GlobalCaseStatsMapper.mapGlobalCaseStatsResponseToDomains(confirmed: $0.confirmed, recovered: $0.recovered, deaths: $0.deaths) }
      .eraseToAnyPublisher()
  }
  
  func getCountries() -> AnyPublisher<[CountryModel], Covid19APIError> {
    self.remote.getCountries()
      .map { CountryMapper.mapCountryResponseToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func getStatsByCountry(country name: String) -> AnyPublisher<GlobalCaseStatsModel, Covid19APIError> {
    self.remote.getStatsByCountry(country: name)
      .map { GlobalCaseStatsMapper.mapGlobalCaseStatsResponseToDomains(confirmed: $0.confirmed, recovered: $0.recovered, deaths: $0.deaths) }
      .eraseToAnyPublisher()
  }
  
  func getCountryCaseStats(by caseType: CovidEndpoints.CaseType) -> AnyPublisher<[CountryCaseStatsModel], Covid19APIError> {
    self.remote.getCountryCaseStats(by: caseType)
      .map { CountryCaseStatsMapper.mapCountryCaseStatsResponseToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
}
