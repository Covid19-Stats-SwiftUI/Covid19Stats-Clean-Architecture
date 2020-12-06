//
//  CountryCaseStatsMapper.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation

final class CountryCaseStatsMapper {
  
  static func mapCountryCaseStatsResponseToDomains(
    input countryCaseStats: [CountryCaseStatsResponse]
  ) -> [CountryCaseStatsModel] {
    return countryCaseStats.map { result in
      return CountryCaseStatsModel(
        provinceState: result.provinceState ?? "Unknown",
        countryRegion: result.countryRegion ?? "Unknown",
        lastUpdate: result.lastUpdate ?? Date(),
        lat: result.lat ?? 0,
        long: result.long ?? 0,
        confirmed: result.confirmed ?? 0,
        recovered: result.recovered ?? 0,
        deaths: result.deaths ?? 0,
        active: result.active ?? 0,
        iso2: result.iso2 ?? ""
      )
    }
  }
  
}
