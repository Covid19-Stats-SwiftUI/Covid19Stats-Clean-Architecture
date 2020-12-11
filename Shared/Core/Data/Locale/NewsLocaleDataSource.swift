//
//  NewsLocaleDataSource.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 12/12/20.
//

import Foundation
import RealmSwift
import Combine

protocol NewsLocaleDataSourceProtocol: class {
  
  func getNews() -> AnyPublisher<[NewsEntity], Error>
  func addNews(from news: [NewsEntity]) -> AnyPublisher<Bool, Error>
  
}

final class NewsLocaleDataSource: NSObject {
  
  private let realm: Realm?
  private init(realm: Realm?) {
    self.realm = realm
  }
  
  static let sharedInstance: (Realm?) -> NewsLocaleDataSource = { realmDatabase in
    return NewsLocaleDataSource(realm: realmDatabase)
  }
  
}

extension NewsLocaleDataSource: NewsLocaleDataSourceProtocol {
  func getNews() -> AnyPublisher<[NewsEntity], Error> {
    return Future<[NewsEntity], Error> { completion in
      if let realm = self.realm {
        let news: Results<NewsEntity> = {
          realm.objects(NewsEntity.self)
            .sorted(byKeyPath: "title")
        }()
        
        completion(.success(news.toArray(ofType: NewsEntity.self)))
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }
    .eraseToAnyPublisher()
  }
  
  func addNews(from news: [NewsEntity]) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      if let realm = self.realm {
        do {
          try realm.write {
            for value in news {
              realm.add(value, update: .all)
            }
            
            completion(.success(true))
          }
        } catch {
          completion(.failure(DatabaseError.requestFailed))
        }
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }
    .eraseToAnyPublisher()
  }
}

extension Results {
  func toArray<T>(ofType: T.Type) -> [T] {
    var array = [T]()
    for index in 0 ..< count {
      if let result = self[index] as? T {
        array.append(result)
      }
    }
    
    return array
  }
}
