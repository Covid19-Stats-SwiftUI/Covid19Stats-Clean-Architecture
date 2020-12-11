//
//  CountryParam+Ext.swift
//  Covid19Stats
//
//  Created by Ari Supriatna on 11/12/20.
//

import Foundation

extension CountryParam {
  
  convenience init(country: CountryResponse) {
    self.init(identifier: country.name, display: "\(country.name) \(country.iso2?.flag ?? "")")
    self.iso2 = country.iso2
  }
  
  static var global: CountryParam {
    CountryParam(country: .init(name: "Global", iso2: ""))
  }
  
}
