//
//  NewsService.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import Foundation

struct NewsAPIService {
  
  static let baseUrl = "https://newsapi.org/v2"
  static let apiKey = "281aab8a2b9843b284920eb64dc512d6"
  
}

enum NewsEndpoints {
  
  enum Gets: Endpoint {
    case topHeadlines
    
    public var url: String {
      switch self {
      case .topHeadlines: return "\(NewsAPIService.baseUrl)/top-headlines"
      }
    }
    
  }
  
}
