//
//  CountryMapper.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation

final class CountryMapper {
  
  static func mapCountryResponseToDomains(input countries: [CountryResponse]) -> [CountryModel] {
    return countries.map { result in
      return CountryModel(name: result.name, iso2: result.iso2 ?? "")
    }
  }
  
}
