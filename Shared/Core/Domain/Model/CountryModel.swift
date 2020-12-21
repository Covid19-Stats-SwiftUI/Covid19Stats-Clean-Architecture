//
//  CountryModel.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation

struct CountryModel: Equatable, Identifiable {
  
  let id = UUID()
  let name: String
  let iso2: String
  
  var displayName: String {
    return "\(iso2.flag) \(name)"
  }
  
  var titleHeader: String {
    return "\(name) \(iso2.flag)"
  }
  
  var url: URL {
    let string = "stats://search?id=\(id)&name=\(name)&iso=\(iso2)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    return URL(string: string)!
  }
  
}
