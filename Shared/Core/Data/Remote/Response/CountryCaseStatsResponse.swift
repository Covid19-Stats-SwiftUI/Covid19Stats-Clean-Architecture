//
//  CountryCaseStatsResponse.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation

struct CountryCaseStatsResponse: Decodable {
  
  let provinceState: String?
  let countryRegion: String?
  let lastUpdate: Date?
  let lat: Double?
  let long: Double?
  let confirmed: Int?
  let recovered: Int?
  let deaths: Int?
  let active: Int?
  let iso2: String?
  
}
