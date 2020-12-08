//
//  DetailGlobalStatsInteractor.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 07/12/20.
//

import Foundation
import Combine

protocol DetailGlobalStatsUseCase {

  func getDetailGlobalStats(by caseType: Endpoints.CaseType) -> AnyPublisher<[CountryCaseStatsModel], Covid19APIError>

}

class DetailGlobalStatsInteractor: DetailGlobalStatsUseCase {

  private let repository: CovidRepositoryProtocol

  required init(repository: CovidRepositoryProtocol) {
    self.repository = repository
  }

  func getDetailGlobalStats(by caseType: Endpoints.CaseType) -> AnyPublisher<[CountryCaseStatsModel], Covid19APIError> {
    return repository.getCountryCaseStats(by: caseType)
  }

}
