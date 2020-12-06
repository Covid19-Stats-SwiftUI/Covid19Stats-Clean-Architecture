//
//  RemoteDataSource.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation

protocol RemoteDataSourceProtocol {
  
  func getGlobalCaseStats(completion: @escaping (Result<GlobalCaseStatsModel, Covid19APIError>) -> Void)
  
}


final class RemoteDataSource: NSObject {
  
  private override init() { }
  
  private let jsonDecoder = Helper.jsonDecoder
  
  static let sharedInstance: RemoteDataSource = RemoteDataSource()
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  
  func getGlobalCaseStats(completion: @escaping (Result<GlobalCaseStatsModel, Covid19APIError>) -> Void) {
    guard let url = URL(string: Endpoints.Gets.global.url) else {
      completion(.failure(.invalidURL))
      return
    }
    
    executeDataTaskAndDecode(with: url, completion: completion)
  }
  
  private func executeDataTaskAndDecode<D: Decodable>(with url: URL, completion: @escaping (Result<D, Covid19APIError>) -> ()) {
    URLSession.shared.dataTask(with: url) { (data, response, error) in
          if let error = error {
              completion(.failure(.error(error as NSError)))
              return
          }
          
          guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
              completion(.failure(.badHTTPResponse))
              return
          }
          
          guard let data = data else {
              completion(.failure(.noData))
              return
          }
          
          do {
              let model = try self.jsonDecoder.decode(D.self, from: data)
              completion(.success(model))
          } catch let error as NSError{
              print(error.localizedDescription)
              completion(.failure(.invalidSerialization))
          }
      }.resume()
  }
  
}
