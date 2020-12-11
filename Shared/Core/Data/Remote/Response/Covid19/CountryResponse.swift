//
//  CountryResponse.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation

struct CountriesResponse: Decodable {
  
  let countries: [CountryResponse]
  
}

struct CountryResponse: Decodable {
  
  let name: String
  let iso2: String?
  
}
