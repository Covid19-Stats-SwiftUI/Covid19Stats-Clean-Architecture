//
//  APICall.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation

struct API {
  
  static let baseUrl = "https://covid19.mathdro.id/api"
  
}

protocol Endpoint {
  
  var url: String { get }
  
}

enum Endpoints {
  
  enum Gets: Endpoint {
    case global
    case countryStats
    case country
    
    public var url: String {
      switch self {
      case .global: return "\(API.baseUrl)"
      case .countryStats: return "\(API.baseUrl)/"
      case .country: return "\(API.baseUrl)/countries/"
      }
    }
  }
  
  enum CaseType: String {
    case confirmed = "confirmed"
    case recovered = "recovered"
    case deaths = "deaths"
  }
  
}
