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
  func getCountryCaseStatsConfirmed(by caseType: Endpoints.CaseType) -> AnyPublisher<[CountryCaseStatsModel], Covid19APIError>
  func getCountryCaseStatsRecovered(by caseType: Endpoints.CaseType) -> AnyPublisher<[CountryCaseStatsModel], Covid19APIError>
  func getCountryCaseStatsDeath(by caseType: Endpoints.CaseType) -> AnyPublisher<[CountryCaseStatsModel], Covid19APIError>
  func getCountries() -> AnyPublisher<[CountryModel], Covid19APIError>
  func getStatsByCountry(country name: String) -> AnyPublisher<GlobalCaseStatsModel, Covid19APIError>
  
}

final class CovidRepository: NSObject {
  
  typealias CovidInstance = (RemoteDataSource) -> CovidRepository
  
  fileprivate let remote: RemoteDataSource
  
  private init(remote: RemoteDataSource) {
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
  
  func getCountryCaseStatsConfirmed(by caseType: Endpoints.CaseType) -> AnyPublisher<[CountryCaseStatsModel], Covid19APIError> {
    self.remote.getCountryCaseStats(by: .confirmed)
      .map  { CountryCaseStatsMapper.mapCountryCaseStatsResponseToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func getCountryCaseStatsRecovered(by caseType: Endpoints.CaseType) -> AnyPublisher<[CountryCaseStatsModel], Covid19APIError> {
    self.remote.getCountryCaseStats(by: .recovered)
      .map  { CountryCaseStatsMapper.mapCountryCaseStatsResponseToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func getCountryCaseStatsDeath(by caseType: Endpoints.CaseType) -> AnyPublisher<[CountryCaseStatsModel], Covid19APIError> {
    self.remote.getCountryCaseStats(by: .deaths)
      .map  { CountryCaseStatsMapper.mapCountryCaseStatsResponseToDomains(input: $0) }
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
  
}
