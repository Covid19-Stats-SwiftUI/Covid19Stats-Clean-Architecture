//
//  GlobalCaseStatsMapper.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation

final class GlobalCaseStatsMapper {
  
  static func mapGlobalCaseStatsResponseToDomains(
    confirmed: GlobalCaseStatsResponse.ValueResponse,
    recovered: GlobalCaseStatsResponse.ValueResponse,
    deaths: GlobalCaseStatsResponse.ValueResponse
  ) -> GlobalCaseStatsModel {
    
    let confirmed = GlobalCaseStatsModel.ValueModel(value: confirmed.value)
    let recovered = GlobalCaseStatsModel.ValueModel(value: recovered.value)
    let deaths = GlobalCaseStatsModel.ValueModel(value: deaths.value)
    
    return GlobalCaseStatsModel(
      confirmed: confirmed,
      recovered: recovered,
      deaths: deaths
    )
  }
  
}
