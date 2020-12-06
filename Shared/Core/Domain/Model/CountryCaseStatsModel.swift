//
//  CountryCaseStatsModel.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation

struct CountryCaseStatsModel: Equatable, Identifiable {
  
  let id = UUID()
  let provinceState: String
  let countryRegion: String
  let lastUpdate: Date
  let lat: Double
  let long: Double
  let confirmed: Int
  let recovered: Int
  let deaths: Int
  let active: Int
  let iso2: String
  
  var displayName: String {
    return "\(iso2.flag) \(provinceState)"
  }
  
}
