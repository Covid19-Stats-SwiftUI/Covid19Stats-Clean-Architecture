//
//  NewsInteractor.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import Foundation
import Combine

protocol NewsUseCase {
  
  func getNews() -> AnyPublisher<[NewsModel], Error>
  
}

class NewsInteractor: NewsUseCase {
  
  private let repository: NewsRepositoryProtocol
  
  required init(repository: NewsRepositoryProtocol) {
    self.repository = repository
  }
  
  func getNews() -> AnyPublisher<[NewsModel], Error> {
    return repository.getNews()
  }
  
}
