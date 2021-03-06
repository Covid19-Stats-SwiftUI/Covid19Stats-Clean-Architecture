//
//  NewsNetworkDataSource.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import Foundation
import Combine
import Alamofire

protocol NewsNetworkDataSourceProtocol {
  
  func getNews() -> AnyPublisher<[News], Error>
  
}

final class NewsNetworkDataSource: NSObject {
  
  private override init() { }
  
  static let sharedInstance: NewsNetworkDataSource = NewsNetworkDataSource()
  
}

extension NewsNetworkDataSource: NewsNetworkDataSourceProtocol {
  
  func getNews() -> AnyPublisher<[News], Error> {
    return Future<[News], Error> { completion in
      
      guard
        let url = URL(string: "\(NewsEndpoints.Gets.topHeadlines.url)?country=id&category=health&apiKey=\(NewsAPIService.apiKey)") else {
        return
      }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: NewsResponse.self) { response in
          switch response.result {
          case .success(let result):
            completion(.success(result.articles))
          case .failure:
            completion(.failure(NewsAPIError.invalidSerialization))
          }
        }
      
    }.eraseToAnyPublisher()
  }
  
}
