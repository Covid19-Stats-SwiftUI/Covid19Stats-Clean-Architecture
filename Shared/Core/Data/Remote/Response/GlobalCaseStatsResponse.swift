//
//  GlobalCaseStatsResponse.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation

struct GlobalCaseStatsResponse: Decodable {
  
  let confirmed: ValueResponse
  let recovered: ValueResponse
  let deaths: ValueResponse
  
  struct ValueResponse: Decodable {
    let value: Int
  }
  
}
