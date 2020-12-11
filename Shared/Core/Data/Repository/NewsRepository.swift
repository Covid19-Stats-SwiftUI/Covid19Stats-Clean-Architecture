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
    self.locale.getNews()
      .flatMap { result  -> AnyPublisher<[NewsModel], Error> in
        if result.isEmpty {
          return self.remote.getNews()
            .map { NewsMapper.mapNewsResponseToEntities(input: $0) }
            .flatMap { self.locale.addNews(from: $0) }
            .filter { $0 } 
            .flatMap { _ in
              self.locale.getNews()
                .map { NewsMapper.mapNewsEntitiesToDomains(input: $0) }
            }
            .eraseToAnyPublisher()
        } else {
          return self.locale.getNews()
            .map { NewsMapper.mapNewsEntitiesToDomains(input: $0) }
            .eraseToAnyPublisher()
        }
      }
      .eraseToAnyPublisher()
  }
  
}
