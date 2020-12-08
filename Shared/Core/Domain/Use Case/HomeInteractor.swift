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

}

class HomeInteractor: HomeUseCase {
  
  private let repository: CovidRepositoryProtocol
  
  required init(repository: CovidRepositoryProtocol) {
    self.repository = repository
  }
  
  func getGlobalCaseStats() -> AnyPublisher<GlobalCaseStatsModel, Covid19APIError> {
    return repository.getGlobalCaseStats()
  }
  
}
