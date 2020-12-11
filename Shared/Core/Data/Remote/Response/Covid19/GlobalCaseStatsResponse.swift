//
//  GlobalCaseStatsResponse.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation

struct GlobalCaseStatsResponse: Decodable {
  
  let title: String?
  let confirmed: ValueResponse
  let recovered: ValueResponse
  let deaths: ValueResponse
  
  struct ValueResponse: Decodable {
    let value: Int
  }
  
}

extension GlobalCaseStatsResponse {
  
  var confirmedText: String {
    Helper.numberFormatter.string(from: NSNumber(value: confirmed.value)) ?? "0"
  }
  
  var recoveredText: String {
    Helper.numberFormatter.string(from: NSNumber(value: recovered.value)) ?? "0"
  }
  
  var deathText: String {
    Helper.numberFormatter.string(from: NSNumber(value: deaths.value)) ?? "0"
  }
  
  static var stub: GlobalCaseStatsResponse {
    .init(title: "Global 🌍", confirmed: ValueResponse(value: 100), recovered: ValueResponse(value: 100), deaths: ValueResponse(value: 100))
  }
  
}
