//
//  NewsRepository.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import Foundation
import Combine

protocol NewsRepositoryProtocol {
  
  func getNews() -> AnyPublisher<[NewsModel], NewsAPIError>
  
}

final class NewsRepository: NSObject {
  
  typealias NewsInstance = (NewsNetworkDataSource) -> NewsRepository
  
  fileprivate let remote: NewsNetworkDataSource
  
  private init(remote: NewsNetworkDataSource) {
    self.remote = remote
  }
  
  static let sharedInstance: NewsInstance = { remoteRepo in
    return NewsRepository(remote: remoteRepo)
  }
  
}

extension NewsRepository: NewsRepositoryProtocol {
  
  func getNews() -> AnyPublisher<[NewsModel], NewsAPIError> {
    self.remote.getNews()
      .map { NewsMapper.mapNewsResponseToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
}
