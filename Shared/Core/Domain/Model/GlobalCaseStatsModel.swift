//
//  GlobalCaseStatsModel.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation

struct GlobalCaseStatsModel: Equatable {
  
  let confirmed: ValueModel
  let recovered: ValueModel
  let deaths: ValueModel
  
  var confirmedText: String {
    Helper.numberFormatter.string(from: NSNumber(value: confirmed.value)) ?? "0"
  }
  
  var recoveredText: String {
    Helper.numberFormatter.string(from: NSNumber(value: recovered.value)) ?? "0"
  }
  
  var deathText: String {
    Helper.numberFormatter.string(from: NSNumber(value: deaths.value)) ?? "0"
  }
  
  struct ValueModel: Equatable {
    let value: Int
  }
  
}

extension GlobalCaseStatsModel {
  
  static var stub: GlobalCaseStatsModel {
    .init(confirmed: ValueModel(value: 100), recovered: ValueModel(value: 100), deaths: ValueModel(value: 100))
  }
  
}

