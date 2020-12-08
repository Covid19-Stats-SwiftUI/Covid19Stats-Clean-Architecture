//
//  CovidNetworkDataSource.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation
import Combine 
import Alamofire

protocol CovidNetworkDataSourceProtocol {
  
  func getGlobalCaseStats() -> AnyPublisher<GlobalCaseStatsResponse, Covid19APIError>
  func getCountryCaseStats(by caseType: CovidEndpoints.CaseType) -> AnyPublisher<[CountryCaseStatsResponse], Covid19APIError>
  func getCountries() -> AnyPublisher<[CountryResponse], Covid19APIError>
  func getStatsByCountry(country name: String) -> AnyPublisher<GlobalCaseStatsResponse, Covid19APIError>
  
}

final class CovidNetworkDataSource: NSObject {
  
  private override init() { }
  
  static let sharedInstance: CovidNetworkDataSource = CovidNetworkDataSource()
  
}

extension CovidNetworkDataSource: CovidNetworkDataSourceProtocol {
  
  func getGlobalCaseStats() -> AnyPublisher<GlobalCaseStatsResponse, Covid19APIError> {
    return Future<GlobalCaseStatsResponse, Covid19APIError> { completion in
      
      guard let url = URL(string: CovidEndpoints.Gets.global.url) else { return }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: GlobalCaseStatsResponse.self) { response in
          switch response.result {
          case .success(let result):
            completion(.success(result))
          case .failure:
            completion(.failure(.invalidSerialization))
          }
        }
      
    }.eraseToAnyPublisher()
  }
  
  
  func getCountries() -> AnyPublisher<[CountryResponse], Covid19APIError> {
    return Future<[CountryResponse], Covid19APIError> { completion in
      
      guard let url = URL(string: CovidEndpoints.Gets.country.url) else { return }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: CountriesResponse.self) { response in
          switch response.result {
          case .success(let result):
            completion(.success(result.countries))
          case .failure:
            completion(.failure(.invalidSerialization))
          }
        }
      
    }.eraseToAnyPublisher()
  }
  
  func getCountryCaseStats(by caseType: CovidEndpoints.CaseType) -> AnyPublisher<[CountryCaseStatsResponse], Covid19APIError> {
    return Future<[CountryCaseStatsResponse], Covid19APIError> { completion in
      
      guard let url = URL(string: CovidEndpoints.Gets.countryStats.url + caseType.rawValue) else { return }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: [CountryCaseStatsResponse].self) { response in
          switch response.result {
          case .success(let result):
            completion(.success(result))
          case .failure:
            completion(.failure(.invalidSerialization))
          }
        }
      
    }.eraseToAnyPublisher()
  }
  
  func getStatsByCountry(country name: String) -> AnyPublisher<GlobalCaseStatsResponse, Covid19APIError> {
    return Future<GlobalCaseStatsResponse, Covid19APIError> { completion in
      
      guard let url = URL(string: CovidEndpoints.Gets.country.url + name) else { return }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: GlobalCaseStatsResponse.self) { response in
          switch response.result {
          case .success(let result):
            completion(.success(result))
          case .failure:
            completion(.failure(.invalidSerialization))
            debugPrint("Failure: \(response)")
          }
        }
      
    }.eraseToAnyPublisher()
  }
  
}
