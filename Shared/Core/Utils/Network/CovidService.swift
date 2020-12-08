//
//  CovidService.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation

struct CovidService {
  
  static let baseUrl = "https://covid19.mathdro.id/api"
  
}

protocol Endpoint {
  
  var url: String { get }
  
}

enum CovidEndpoints {
  
  enum Gets: Endpoint {
    case global
    case countryStats
    case country
    
    public var url: String {
      switch self {
      case .global: return "\(CovidService.baseUrl)"
      case .countryStats: return "\(CovidService.baseUrl)/"
      case .country: return "\(CovidService.baseUrl)/countries/"
      }
    }
  }
  
  enum CaseType: String {
    case confirmed = "confirmed"
    case recovered = "recovered"
    case deaths = "deaths"
  }
  
}
