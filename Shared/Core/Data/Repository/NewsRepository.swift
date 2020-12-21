//
//  NewsRepository.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import Foundation
import Combine

protocol NewsRepositoryProtocol {
  
  func getNews() -> AnyPublisher<[NewsModel], Error>
  
}

final class NewsRepository: NSObject {
  
  typealias NewsInstance = (NewsLocaleDataSource, NewsNetworkDataSource) -> NewsRepository
  
  fileprivate let remote: NewsNetworkDataSource
  fileprivate let locale: NewsLocaleDataSource
  
  private init(locale: NewsLocaleDataSource, remote: NewsNetworkDataSource) {
    self.locale = locale
    self.remote = remote
  }
  
  static let sharedInstance: NewsInstance = { localeRepo, remoteRepo in
    return NewsRepository(locale: localeRepo, remote: remoteRepo)
  }
  
}

extension NewsRepository: NewsRepositoryProtocol {
  
  func getNews() -> AnyPublisher<[NewsModel], Error> {
    self.remote.getNews()
      .map { NewsMapper.mapNewsResponseToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
}
