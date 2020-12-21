//
//  GlobalCaseStatsEntry.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation
import WidgetKit 

struct GlobalCaseStatsEntry: TimelineEntry {
  
  public let date: Date
  public var isPlaceholder = false
  public let globalStats: GlobalCaseStatsResponse
  
  public var url: URL? = nil
  
}

extension GlobalCaseStatsEntry {
  
  static var stub: GlobalCaseStatsEntry {
    .init(date: Date(), globalStats: GlobalCaseStatsResponse(title: "Global 🌍", confirmed: GlobalCaseStatsResponse.ValueResponse(value: 100), recovered: GlobalCaseStatsResponse.ValueResponse(value: 100), deaths: GlobalCaseStatsResponse.ValueResponse(value: 100)))
  }
  
  static var placeholder: GlobalCaseStatsEntry {
    .init(date: Date(), isPlaceholder: true, globalStats: .init(title: "-", confirmed: GlobalCaseStatsResponse.ValueResponse(value: 100), recovered: GlobalCaseStatsResponse.ValueResponse(value: 100), deaths: GlobalCaseStatsResponse .ValueResponse(value: 100)))
  }
  
}
